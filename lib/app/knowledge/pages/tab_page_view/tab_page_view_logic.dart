import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'tab_page_view_state.dart';

class TabPageViewLogic extends GetxController
    with GetSingleTickerProviderStateMixin {
  final TabPageViewState state = TabPageViewState();

  late TabController pageController;

  @override
  void onInit() {
    super.onInit();
    pageController = TabController(initialIndex: 0, length: 2, vsync: this);
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
