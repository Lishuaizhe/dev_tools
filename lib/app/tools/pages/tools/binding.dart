import 'package:get/get.dart';

import 'logic.dart';

class ToolsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ToolsLogic());
  }
}
