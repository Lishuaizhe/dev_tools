import 'package:get/get.dart';

import 'video_player_screen_logic.dart';

class VideoPlayerScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => VideoPlayerScreenLogic());
  }
}
