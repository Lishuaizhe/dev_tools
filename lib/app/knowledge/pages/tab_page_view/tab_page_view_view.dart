import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../router/routes.dart';
import '../../convertor/custom_gesture_detector.dart';
import 'tab_page_view_logic.dart';

class TabPageViewPage extends StatelessWidget {
  TabPageViewPage({super.key});

  final logic = Get.find<TabPageViewLogic>();
  final state = Get.find<TabPageViewLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBodyBehindAppBar: true,
      appBar: AppBar(
          title: const Text('TabPageViewPage'),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue, Colors.green],
              ),
            ),
          )),
      body: bodyView(),
    );
  }

  Container bodyView() {
    return Container(
      color: Colors.green,
      child: TabBarView(
        controller: logic.pageController,
        children: [
          Container(
            color: Colors.blue,
            child: const Center(
              child: Text('Some data'),
            ),
          ),
          // gestureDetectorTypeOne(),
          PageView(
            scrollDirection: Axis.vertical,
            children: [
              gestureDetectorTypeTow(),
              gestureDetectorTypeTow(),
              gestureDetectorTypeTow(),
              gestureDetectorTypeTow(),
              gestureDetectorTypeTow(),
            ],
          )
        ],
      ),
    );
  }

  GestureDetector gestureDetectorTypeOne() {
    return GestureDetector(
      onHorizontalDragUpdate: (details) async {
        // 当用户向左滑动时，details.delta.dx 会小于0
        if (details.delta.dx < 0) {
          Get.toNamed(Routes.videoPlayerScreenPage);
        } else {
          logic.pageController.animateTo(0);
        }
      },
      child: Container(
        color: Colors.green[400],
        child: const Center(
          child: Text('Another data'),
        ),
      ),
    );
  }

  gestureDetectorTypeTow() {
    return CustomGestureDetector(
      onLeftSwipe: () {
        Get.toNamed(Routes.videoPlayerScreenPage);
      },
      child: Container(
        height: 500,
        color: Colors.green[400],
        child: const Center(
          child: Text('Another data'),
        ),
      ),
    );
  }
}
