import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'information_home_state.dart';

/// @description:
/// @author
/// @date: 2024-06-03 09:40:06
class InformationHomeLogic extends GetxController
    with GetSingleTickerProviderStateMixin {
  final state = InformationHomeState();

  late var pageController;

  @override
  void onInit() {
    super.onInit();
    pageController = TabController(length: 3, vsync: this);
  }

  void onPageChanged(int value) {
    state.pageIndex.value = value;
    update();
  }
}
