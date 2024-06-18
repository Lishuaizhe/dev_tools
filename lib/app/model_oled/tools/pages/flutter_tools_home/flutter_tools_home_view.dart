import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'flutter_tools_home_logic.dart';
import 'flutter_tools_home_state.dart';

/// @description:
/// @author
/// @date: 2024-05-31 22:08:21
class FlutterToolsHomePage extends StatelessWidget {
  final FlutterToolsHomeLogic logic = Get.put(FlutterToolsHomeLogic());
  final FlutterToolsHomeState state = Get.find<FlutterToolsHomeLogic>().state;

  FlutterToolsHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
            child: Text('FlutterToolsHomePage'),
          ),
          SizedBox(height: 20.w),
          ElevatedButton(
            onPressed: () {
              // AppRouter.push(Routes.flutterAnimation);
            },
            child: const Text('to FlutterAnimationPage'),
          )
        ],
      ),
    );
  }
}
