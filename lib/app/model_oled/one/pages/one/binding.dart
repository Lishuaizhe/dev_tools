import 'package:get/get.dart';

import 'logic.dart';

class OneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OneLogic());
  }
}
