import 'package:get/get.dart';

import 'logic.dart';

class MapGaoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MapGaoLogic());
  }
}
