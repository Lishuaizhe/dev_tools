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
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: const Color(0x00FFFFFF),
        flexibleSpace: Center(
          child: TabBar(
            controller: logic.pageController,
            isScrollable: false,
            tabs: [
              const Tab(text: "直播").marginOnly(bottom: 5.w),
              const Tab(text: "视频").marginOnly(bottom: 5.w),
            ],
            dividerHeight: 0,
            indicator: UnderlineTabIndicator(
              borderSide:
                  BorderSide(width: 2.w, color: const Color(0xFF2FA9FD)),
              insets: EdgeInsets.only(left: 20.w, right: 20.w),
              borderRadius: BorderRadius.circular(3.w),
            ),
            padding: EdgeInsets.only(top: 20.w),
            indicatorWeight: 1.w,
            indicatorColor: const Color(0xFF2FA9FD),
            indicatorPadding: EdgeInsets.all(10.w),
            indicatorSize: TabBarIndicatorSize.label,
            physics: const BouncingScrollPhysics(),
            labelColor: const Color(0xFF2FA9FD),
            labelStyle: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w400),
            unselectedLabelColor: Colors.black,
            unselectedLabelStyle:
                TextStyle(fontSize: 15.sp, fontWeight: FontWeight.normal),
          ).paddingSymmetric(horizontal: 100.w),
        ),
      ),
      body: bodyView(),
    );
  }

  Widget bodyView() {
    return TabBarView(
      controller: logic.pageController,
      children: [
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
        // gestureDetectorTypeOne(),
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
    ).marginOnly(top: state.statusBarHeight.value);
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

  gestureDetectorTypeTow() {
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
