import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import 'video_player_screen_logic.dart';

class VideoPlayerScreenPage extends StatelessWidget {
  VideoPlayerScreenPage({super.key});

  final logic = Get.find<VideoPlayerScreenLogic>();
  final state = Get.find<VideoPlayerScreenLogic>().state;

  @override
  Widget build(BuildContext context) {
    double statusBarHeight;

    try {
      statusBarHeight = MediaQuery.of(context).padding.top;
    } catch (e) {
      // 如果无法获取状态栏高度，设置一个默认值
      statusBarHeight = 20.0;
    }

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        top: false,
        bottom: false,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.white,
          child: _voidPlay(),
        ),
      ).marginOnly(top: statusBarHeight),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: logic.controllerPlay,
      //   child: Icon(
      //     logic.videoPlayerController.value.isPlaying
      //         ? Icons.pause
      //         : Icons.play_arrow,
      //   ),
      // ),
    );
  }

  _voidPlay() {
    return Center(
      child: VideoPlayer(
        logic.videoPlayerController,
      ),
    );
  }
}
