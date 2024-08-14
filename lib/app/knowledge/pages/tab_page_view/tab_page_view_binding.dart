import 'package:get/get.dart';

import 'tab_page_view_logic.dart';

class TabPageViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TabPageViewLogic());
  }
}
