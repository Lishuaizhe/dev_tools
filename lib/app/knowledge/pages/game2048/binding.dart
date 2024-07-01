import 'package:get/get.dart';

import 'logic.dart';

class Game2048Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Game2048Logic());
  }
}
