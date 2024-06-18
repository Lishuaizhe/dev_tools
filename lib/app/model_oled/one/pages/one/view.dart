import 'package:dev_tools/app/model_oled/one/pages/comment/time_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../comment/activity_indicators.dart';
import 'logic.dart';

class OnePage extends StatelessWidget {
  OnePage({super.key});

  final logic = Get.find<OneLogic>();
  final state = Get.find<OneLogic>().state;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      child: Column(children: [
        const TimeBar(),
        _target(),
        // Expanded(
        //     child: Column(children: [
        //   _targetTitle(),
        //   _targetList(),
        //   _targetList(),
        //   _targetList(),
        //   _targetList(),
        // ]))
      ]),
    ));
  }

  Widget _target() {
    return Container(
      padding: EdgeInsets.only(left: 20.w, top: 20.h, bottom: 40.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ActivityIndicators(
                title: '移动',
                value: '409',
                uitls: 'kcal',
                color: Colors.red,
              ),
              ActivityIndicators(
                title: '锻炼',
                value: '29',
                uitls: 'min',
                color: Colors.greenAccent,
              ),
              ActivityIndicators(
                title: '站立',
                value: '15',
                uitls: 'hours',
                color: Colors.blueAccent,
              ),
            ],
          ),
          SizedBox(
            width: 200.w,
            height: 200.w,
            child: Container(
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }

  // Widget _targetList() {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //     children: [
  //       Card(
  //         child: Container(
  //           width: 140.w,
  //           height: 140.w,
  //           decoration: BoxDecoration(
  //             color: Colors.blueAccent,
  //             borderRadius: BorderRadius.circular(10),
  //           ),
  //         ),
  //       ),
  //       Card(
  //         child: Container(
  //           width: 140.w,
  //           height: 140.w,
  //           decoration: BoxDecoration(
  //             color: Colors.blueAccent,
  //             borderRadius: BorderRadius.circular(10),
  //           ),
  //         ),
  //       ),
  //     ],
  //   ).marginSymmetric(horizontal: 20.w);
  // }

  // Widget _targetTitle() {
  //   return const Row(
  //     children: [
  //       Text('活动'),
  //       Spacer(),
  //       Text('展开/收起', style: TextStyle(color: Colors.grey)),
  //     ],
  //   );
  // }
}
