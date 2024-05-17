import 'package:get/get.dart';

import 'logic.dart';

class MyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyLogic());
  }
}
