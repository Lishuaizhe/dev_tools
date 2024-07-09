import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'knowledge_home_state.dart';

/// @description:
/// @author
/// @date: 2024-06-03 09:40:54
class KnowledgeHomeLogic extends GetxController {
  final state = KnowledgeHomeState();
  final Dio _dio = Dio();

  late Timer _timer;
  final _isFetching = false.obs;

  @override
  void onInit() {
    super.onInit();
    networkService();
    initDate();
    // 每分钟请求一次
    // _timer = Timer.periodic(const Duration(seconds: 10), (timer) {
    // initDate();
    // });
  }

  @override
  void onClose() {
    super.onClose();
    _timer.cancel();
  }

  void initDate() async {
    if (_isFetching.value) return;
    _isFetching.value = true;
    try {
      await _dio
          .request('https://api.coindesk.com/v1/bpi/currentprice/BTC.json')
          .then((value) {
        state.date.value = value.data;
        var stateValue = "${state.date['bpi']['USD']["rate"]}";
        state.stateValue.value = parseStringToDouble(stateValue).toDouble();
        state.stateDateTime.value = state.date['time']['updated'];
      });
    } catch (e) {
      if (kDebugMode) {
        print('Error: $e');
      }
    } finally {
      _isFetching.value = false;
    }
  }

  num parseStringToDouble(String value) {
    NumberFormat format = NumberFormat("#,##0.###", "en_US");
    return format.parse(value);
  }

  void networkService() {}

  // 使用 rootBundle 读取 assets 中的文件
  Future<String> loadAsset(String path) async {
    return await rootBundle.loadString(path);
  }

  // Future initReptiles() async {
  //   try {
  //     final jsonString = await loadAsset('assets/json/reptiles.json');
  //     final Map<String, dynamic> reptiles = json.decode(jsonString);
  //     state.listDate.add(reptiles);
  //   } catch (e) {
  //     if (kDebugMode) {
  //       print(e);
  //     }
  //   }
  // }

  // Get the plotted chart
  void getChart() async {
    await _dio
        .request(
            'https://api.coingecko.com/api/v3/coins/bitcoin/market_chart?vs_currency=usd&days=1')
        .then((value) {
      state.chartDate.value = value.data;
    });
  }
}
