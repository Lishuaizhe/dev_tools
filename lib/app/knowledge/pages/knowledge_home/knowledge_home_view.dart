import 'package:dev_tools/router/app_router.dart';
import 'package:dev_tools/router/routes.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('KnowledgeHome'),
      ),
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _itemView(
                onTap: () {
                  Get.toNamed(Routes.sliverDemoPage);
                },
                text: 'SliverDemoPage',
              ),
              _itemView(
                onTap: () {
                  Get.toNamed(Routes.knowledge2048);
                },
                text: '2048',
              ),
              _itemView(
                onTap: () {
                  Get.toNamed(Routes.meeting);
                },
                text: '加入会议',
              ),
              _itemView(
                onTap: () {
                  Get.toNamed(Routes.resourceMeeting);
                },
                text: '资源会议',
              ),
              // AlertDialog(
              //   title: const Text('提示'),
              //   content: const Text('这是一个弹窗'),
              //   actions: [
              //     TextButton(
              //       onPressed: () {
              //         Get.back();
              //       },
              //       child: const Text('确定'),
              //     ),
              //   ],
              // ),
              _itemView(
                onTap: () {
                  // Get.toNamed(Routes.boundedFrictionDemoPage);
                },
                text: 'BoundedFrictionDemoPage',
              ),
            ],
          ),
        ),
      ),
    );
    // return SafeArea(
    //   child: Obx(() => Column(
    //         children: [
    //           Text(logic.state.stateDateTime.value),
    //           _BTCValue(),
    //           SizedBox(
    //             width: double.infinity,
    //             height: 250.h,
    //             child: CustomPaint(
    //               painter:
    //                   LineChartPainterNew(dateList: state.chartDate['prices']),
    //             ),
    //           ).paddingSymmetric(horizontal: 15.w, vertical: 20.w),
    //           ElevatedButton(
    //             onPressed: () {
    //               logic.initDate();
    //               logic.getChart();
    //             },
    //             child: const Text('请求新的数据', maxLines: 10),
    //           ),
    //           Text('${state.chartDate['prices'][0]}'),
    //         ],
    //       )),
    // );
  }

  Widget _itemView({required GestureTapCallback? onTap, required String text}) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 100.w,
        height: 100.w,
        child: Card(
          color: Colors.white,
          child: Center(child: Text(text)),
        ),
      ),
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
