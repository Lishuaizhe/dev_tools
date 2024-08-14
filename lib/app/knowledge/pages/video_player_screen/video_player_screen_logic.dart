import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import 'video_player_screen_state.dart';

class VideoPlayerScreenLogic extends GetxController {
  final VideoPlayerScreenState state = VideoPlayerScreenState();

  late VideoPlayerController _controller;

  VideoPlayerController get videoPlayerController => _controller;


  @override
  void onInit() {
    super.onInit();
    _controller = VideoPlayerController.networkUrl(
      Uri.parse(
        "https://v-moment-prod.jikeint.com/im/1688381348031.mp4",
      ), // 这里替换成不同屏幕比例的视频URL
    )..initialize().then((_) {
      _controller.play();
      _controller.setLooping(true);
      update();
    });
  }

  @override
  void onClose() {
    _controller.dispose();
    super.onClose();
  }

  void controllerPlay() {
    _controller.value.isPlaying ? _controller.pause() : _controller.play();
  }


}
