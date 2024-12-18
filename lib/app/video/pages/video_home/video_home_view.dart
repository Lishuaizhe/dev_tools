import 'package:bruno/bruno.dart';
import 'package:dev_tools/app/video/pages/video_home/draggable_progress_bar';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import '../../../../router/routes.dart';
import '../../../knowledge/convertor/custom_gesture_detector.dart';
import 'video_home_logic.dart';

class VideoHomePage extends StatelessWidget {
  VideoHomePage({super.key});

  final logic = Get.find<VideoHomeLogic>();
  final state = Get.find<VideoHomeLogic>().state;

  // final _currentValue = 50.0.obs;

  late BuildContext _context;

  // final _isDragging = false.obs;

  // void _onProgressChanged(double progress) {
  //   _isDragging.value = progress != 0.0 && progress != 1.0;
  // }

  @override
  Widget build(BuildContext context) {
    _context = context;
    return Scaffold(
      // extendBodyBehindAppBar: true,
      appBar: AppBar(
        flexibleSpace: Center(
          // child: TabBar(
          //   controller: logic.pageController,
          //   isScrollable: false,
          //   tabs: const [
          //     Tab(text: "广告"),
          //     Tab(text: "直播"),
          //     Tab(text: "视频"),
          //   ],
          // ),
        ),
      ),
      // body: bodyView(),
    );
  }

  Widget bodyView() {
    return TabBarView(
      controller: logic.pageController,
      children: [
        const AndroidView(viewType: 'native_fragment_view'),
        Center(
          child: BrnAbnormalStateWidget(
            topOffset: 300,
            bgColor: Colors.transparent,
            content: '暂无数据\n请稍后重试',
            img: Image.asset(
              'assets/images/knowledge/home_page_login.png',
              width: 105.w,
              height: 105.w,
            ),
          ),
        ),
        // gestureDetectorTypeTow(),
      ],
    );
  }

  GestureDetector gestureDetectorTypeOne() {
    return GestureDetector(
      onHorizontalDragUpdate: (details) async {
        // 当用户向左滑动时，details.delta.dx 会小于0
        if (details.delta.dx < 0) {
          Get.toNamed(Routes.videoPlayerScreenPage);
        } else {
          logic.pageController.animateTo(0);
        }
      },
      child: const Center(
        child: Text('Another data'),
      ),
    );
  }

  Widget gestureDetectorTypeTow() {
    return SafeArea(
      top: true,
      child: Stack(
        children: [
          // _voidPlay(),
          playPaseView(),
          Obx(_slider),
        ],
      ),
    );
  }

  CustomGestureDetector playPaseView() {
    return CustomGestureDetector(
      onLeftSwipe: () {
        // Get.toNamed(Routes.videoPlayerScreenPage);
        BrnToast.show('onLeftSwipe', _context);
      },
      child: GestureDetector(
        onTap: () {
          BrnToast.show('11111', _context);
        },
        child: Image.asset(
          'assets/images/knowledge/home_page_login.png',
          width: double.infinity,
          height: double.infinity,
        ),
      ),
    );
  }

  // Widget _voidPlay() {
  //   return Center(
  //     child: VideoPlayer(
  //       logic.videoPlayerController,
  //     ),
  //   );
  // }

  Widget _slider() => Positioned(
        bottom: 20,
        right: 0,
        left: 0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Current Value: ${state.progress.value}',
              style: TextStyle(fontSize: 20.sp),
            ),
            Obx(
              () => DraggableProgressBar(
                width: 400,
                height: 20,
                value: state.progress.value,
                onChanged: (value) {
                  state.progress.value = value;
                },
              ),
            ),
            // SizedBox(
            //   height: 100,
            //   width: 400,
            //   child: Slider(
            //     value: _currentValue.value,
            //     min: 0,
            //     max: 100,
            //     divisions: 100,
            //     label: _currentValue.round().toString(),
            //     onChanged: (double value) {
            //       _currentValue.value = value;
            //     },
            //   ),
            // ),
          ],
        ),
      );
}

/* CustomGestureDetector(
        onLeftSwipe: () {
          Get.toNamed(Routes.videoPlayerScreenPage);
        }, */

class ProgressBar extends StatefulWidget {
  final Function(double) onProgressChanged;

  const ProgressBar({super.key, required this.onProgressChanged});

  @override
  _ProgressBarState createState() => _ProgressBarState();
}

class _ProgressBarState extends State<ProgressBar> {
  double _progress = 0.0;

  void _onHorizontalDragUpdate(DragUpdateDetails details) {
    setState(() {
      _progress += details.primaryDelta! / MediaQuery.of(context).size.width;
      _progress = _progress.clamp(0.0, 1.0);
    });
    widget.onProgressChanged(_progress);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragUpdate: _onHorizontalDragUpdate,
      child: Container(
        height: 50,
        color: Colors.blue,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              right: MediaQuery.of(context).size.width * (1.0 - _progress),
              child: Container(color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}

class VideoPlayerWidget extends StatelessWidget {
  final bool isDragging;

  const VideoPlayerWidget({super.key, required this.isDragging});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragUpdate: isDragging
          ? null // 如果正在拖动进度条，则不处理视频的滑动事件
          : (details) {
              // 处理视频的水平拖动事件
              print("Video player horizontal drag update");
            },
      child: Container(
        color: Colors.green,
        child: const Center(
          child: Text(
            'Video Player',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
