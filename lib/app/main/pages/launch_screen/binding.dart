import 'package:get/get.dart';

import 'logic.dart';

class LaunchScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LaunchScreenLogic());
  }
}
