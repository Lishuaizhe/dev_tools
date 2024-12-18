import 'package:bruno/bruno.dart';
import 'package:dev_tools/app/about/pages/about_home/about_home_logic.dart';
import 'package:dev_tools/app/information/pages/information_home/information_home_logic.dart';
import 'package:dev_tools/app/knowledge/pages/knowledge_home/knowledge_home_logic.dart';
import 'package:dev_tools/app/video/pages/video_home/video_home_logic.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'state.dart';

class HomeLogic extends FullLifeCycleController with FullLifeCycleMixin {
  final HomeState state = HomeState();

  final PageController pageController = PageController();

  @override
  void onInit() {
    super.onInit();
    initLogic();
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
  void onDetached() {}

  @override
  void onHidden() {}

  @override
  void onInactive() {}

  @override
  void onPaused() {}

  @override
  void onResumed() {}

  void initBrnBottomTabBarItemList() {
    state.tabItems.add(
      const BrnBottomTabBarItem(
        icon: Icon(Icons.explore_rounded),
        title: Text("Explore"),
      ),
    );
    state.tabItems.add(
      const BrnBottomTabBarItem(
        icon: Icon(Icons.my_library_books),
        title: Text("Library"),
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
    Get.lazyPut(() => InformationHomeLogic());
    Get.lazyPut(() => VideoHomeLogic());
    Get.lazyPut(() => KnowledgeHomeLogic());
    Get.lazyPut(() => AboutHomeLogic());
  }

  void deleteLogic() {
    Get.delete<InformationHomeLogic>();
    Get.delete<VideoHomeLogic>();
    Get.delete<KnowledgeHomeLogic>();
    Get.delete<AboutHomeLogic>();
  }
}
