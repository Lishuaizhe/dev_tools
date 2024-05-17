import 'package:get/get.dart';

import 'logic.dart';

class UnknownRouteBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UnknownRouteLogic());
  }
}
