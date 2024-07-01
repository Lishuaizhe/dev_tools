import 'package:get/get.dart';

import 'sliver_demo_logic.dart';

class SliverDemoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SliverDemoLogic());
  }
}
