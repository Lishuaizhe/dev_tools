import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'video_home_state.dart';

class VideoHomeLogic extends GetxController
    with GetSingleTickerProviderStateMixin {
  final VideoHomeState state = VideoHomeState();

  late TabController pageController;

  @override
  void onInit() {
    super.onInit();
    pageController = TabController(initialIndex: 0, length: 3, vsync: this);

    try {
      state.statusBarHeight.value = MediaQuery.of(Get.context!).padding.top;
    } catch (e) {
      rethrow;
    }
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
