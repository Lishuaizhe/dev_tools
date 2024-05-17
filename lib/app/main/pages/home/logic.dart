import 'package:bruno/bruno.dart';
import 'package:dev_tools/app/my/pages/my/logic.dart';
import 'package:dev_tools/app/one/pages/one/logic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../tools/pages/tools/logic.dart';
import 'state.dart';

class HomeLogic extends FullLifeCycleController with FullLifeCycleMixin {
  final HomeState state = HomeState();

  final PageController pageController = PageController();

  @override
  void onInit() {
    super.onInit();
    initLogic();
    initBrnBottomTabBarItemList();
    pageController.addListener(() {
      state.tagIndex.value = pageController.page!.toInt();
    });
  }

  @override
  void dispose() {
    pageController.dispose();

    deleteLogic();

    super.dispose();
  }

  @override
  void onDetached() {
    // TODO: implement onDetached
  }

  @override
  void onHidden() {
    // TODO: implement onHidden
  }

  @override
  void onInactive() {
    // TODO: implement onInactive
  }

  @override
  void onPaused() {
    // TODO: implement onPaused
  }

  @override
  void onResumed() {
    // TODO: implement onResumed
  }

  void initBrnBottomTabBarItemList() {
    state.tabItems.add(
      BrnBottomTabBarItem(
        icon: const Icon(Icons.cloud),
        title: Text(
          "首页",
          style: TextStyle(fontSize: 14.sp),
        ),
      ),
    );
    state.tabItems.add(
      BrnBottomTabBarItem(
        icon: const Icon(Icons.build),
        title: Text(
          "工具",
          style: TextStyle(fontSize: 14.sp),
        ),
      ),
    );
    state.tabItems.add(
      BrnBottomTabBarItem(
        icon: const Icon(Icons.adb),
        title: Text(
          "我的",
          style: TextStyle(fontSize: 14.sp),
        ),
        // badge: Container(
        //   width: 5.w,
        //   height: 5.w,
        //   decoration: BoxDecoration(
        //     color: Colors.redAccent,
        //     borderRadius: BorderRadius.circular(10),
        //   ),
        // ).marginOnly(right: 40.w, top: 4.w),
      ),
    );
  }

  void onBottomTabBarTap(int value) {
    state.tagIndex.value = value;
    pageController.jumpToPage(value);
  }

  void onPageChanged(int value) {
    state.tagIndex.value = value;
  }

  void initLogic() {
    Get.lazyPut(() => OneLogic());
    Get.lazyPut(() => ToolsLogic());
    Get.lazyPut(() => MyLogic());
  }

  void deleteLogic() {
    Get.delete<OneLogic>();
    Get.delete<ToolsLogic>();
    Get.delete<MyLogic>();
  }
}
