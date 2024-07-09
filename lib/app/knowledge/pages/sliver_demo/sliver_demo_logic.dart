import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'sliver_demo_state.dart';

class SliverDemoLogic extends GetxController {
  final SliverDemoState state = SliverDemoState();

  final ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(() {
      print(scrollController.offset);
      if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
        print('scrollController.position.pixels: ${scrollController.position.pixels}');
        print('scrollController.position.maxScrollExtent: ${scrollController.position.maxScrollExtent}');
      }
    });
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
