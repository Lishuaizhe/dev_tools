import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../router/routes.dart';
import '../../../knowledge/convertor/custom_gesture_detector.dart';
import 'video_home_logic.dart';

class VideoHomePage extends StatelessWidget {
  VideoHomePage({super.key});

  final logic = Get.find<VideoHomeLogic>();
  final state = Get.find<VideoHomeLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBodyBehindAppBar: true,
      appBar: AppBar(
        flexibleSpace: Center(
          child: TabBar(
            controller: logic.pageController,
            isScrollable: false,
            tabs: const [
              Tab(text: "广告"),
              Tab(text: "直播"),
              Tab(text: "视频"),
            ],
          ),
        ),
      ),
      body: bodyView(),
    );
  }

  Widget bodyView() {
    return TabBarView(
      controller: logic.pageController,
      children: [
        const AndroidView(viewType: 'native_fragment_view'),
        Center(
          child: BrnAbnormalStateWidget(
            topOffset: 300,
            bgColor: Colors.transparent,
            content: '暂无数据\n请稍后重试',
            img: Image.asset(
              'assets/images/knowledge/home_page_login.png',
              width: 105.w,
              height: 105.w,
            ),
          ),
        ),
        PageView(
          scrollDirection: Axis.vertical,
          children: [
            gestureDetectorTypeTow(),
            gestureDetectorTypeTow(),
            gestureDetectorTypeTow(),
            gestureDetectorTypeTow(),
          ],
        )
      ],
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
        child: const Center(
          child: Text('Another data'),
        ),
      ),
    );
  }

  Widget gestureDetectorTypeTow() {
    return CustomGestureDetector(
      onLeftSwipe: () {
        Get.toNamed(Routes.videoPlayerScreenPage);
      },
      child: Container(
        color: Colors.transparent,
        height: double.infinity,
        child: const Center(
          child: Text('向下滑动更多'),
        ),
      ),
    );
  }
}
