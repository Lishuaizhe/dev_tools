import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../framework/comment/animation_counter.dart';
import '../../../../framework/comment/line_chart_painter_btc.dart';
import 'knowledge_home_logic.dart';
import 'knowledge_home_state.dart';

/// @description:
/// @author
/// @date: 2024-06-03 09:40:54
class KnowledgeHomePage extends StatelessWidget {
  final KnowledgeHomeLogic logic = Get.put(KnowledgeHomeLogic());
  final KnowledgeHomeState state = Get.find<KnowledgeHomeLogic>().state;

  KnowledgeHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(() => Column(
            children: [
              Text(logic.state.stateDateTime.value),
              _BTCValue(),
              SizedBox(
                width: double.infinity,
                height: 250.h,
                child: CustomPaint(
                  painter:
                      LineChartPainterNew(dateList: state.chartDate['prices']),
                ),
              ).paddingSymmetric(horizontal: 15.w, vertical: 20.w),
              ElevatedButton(
                onPressed: () {
                  logic.initDate();
                  logic.getChart();
                },
                child: const Text('请求新的数据', maxLines: 10),
              ),
              Text('${state.chartDate['prices'][0]}'),
            ],
          )),
    );
  }

  // ignore: non_constant_identifier_names
  Widget _BTCValue() {
    return Obx(() => Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: state
                  .getIntegerPartDigits(state.stateValue.value)
                  .reversed
                  .map(
                (e) {
                  return AnimationCounter(
                    value: double.parse(e.toString()),
                    duration: const Duration(seconds: 1),
                  );
                },
              ).toList(),
            ),
            Container(
              width: 5.w,
              height: 5.w,
              margin: EdgeInsets.only(bottom: 10.w, right: 10.w),
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10.w)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: state
                  .getDecimalPartDigits(state.stateValue.value)
                  .reversed
                  .map(
                (e) {
                  return AnimationCounter(
                    value: double.parse(e.toString()),
                    duration: const Duration(seconds: 1),
                  );
                },
              ).toList(),
            ),
          ],
        ));
  }
}
