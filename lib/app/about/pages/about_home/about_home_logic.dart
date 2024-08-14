import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'about_home_state.dart';

/// @description:
/// @author
/// @date: 2024-06-03 09:43:00
class AboutHomeLogic extends GetxController {
  final state = AboutHomeState();

  var scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(_handleScroll);
  }

  @override
  void onClose() {
    super.onClose();
    scrollController.dispose();
  }

  void _handleScroll() {
    bool shouldShowTop = scrollController.offset < 150.w;
    if (state.isShowTop.value != shouldShowTop) {
      state.isShowTop.value = shouldShowTop;
    }
  }
}
