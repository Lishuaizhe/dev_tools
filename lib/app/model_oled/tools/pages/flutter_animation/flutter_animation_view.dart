import 'package:dev_tools/framework/comment/animation_counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'flutter_animation_logic.dart';
import 'flutter_animation_state.dart';

/// @description:
/// @author
/// @date: 2024-05-31 22:07:08
class FlutterAnimationPage extends StatefulWidget {
  const FlutterAnimationPage({super.key});

  @override
  State<FlutterAnimationPage> createState() => _FlutterAnimationPageState();
}

class _FlutterAnimationPageState extends State<FlutterAnimationPage> {
  final FlutterAnimationLogic logic = Get.put(FlutterAnimationLogic());

  final FlutterAnimationState state = Get.find<FlutterAnimationLogic>().state;

  var boxWidth = 200.0;
  var boxHeight = 200.0;
  var boxColor = Colors.blue;

  var animatedSwitcherText = 'Flutter';

  var crossFadeState = CrossFadeState.showFirst;

  var opacity = 0.1;

  var top = 0.0;

  var tweenAnimationBuilder = false;

  var tweenAnimationBuilderValue = 0.0;

  @override
  void initState() {
    super.initState();
  }

  //time to dispose

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FlutterAnimationPage'),
      ),
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (tweenAnimationBuilderValue == 9) {
                        tweenAnimationBuilderValue = 0;
                      }
                      tweenAnimationBuilderValue++;
                    });
                  },
                  child: const Text('TweenAnimationBuilder')),
              const SizedBox(height: 10),
              SizedBox(
                height: 100,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AnimationCounter(
                      value: tweenAnimationBuilderValue,
                      duration: const Duration(seconds: 1),
                    ),
                    AnimationCounter(
                      value: tweenAnimationBuilderValue,
                      duration: const Duration(seconds: 1),
                    ),
                    AnimationCounter(
                      value: tweenAnimationBuilderValue,
                      duration: const Duration(seconds: 1),
                    ),
                    AnimationCounter(
                      value: tweenAnimationBuilderValue,
                      duration: const Duration(seconds: 1),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.w),
              _tweenAnimationBuilder().marginOnly(bottom: 20.w),
              animatedContainer().marginOnly(bottom: 20.w),
              animatedSwitcher().marginOnly(bottom: 20.w),
              gestureDetector().marginOnly(bottom: 20.w),
              animatedOpacityPadding().marginOnly(bottom: 20.w),
            ],
          ),
        ),
      ),
    );
  }

  GestureDetector _tweenAnimationBuilder() {
    return GestureDetector(
      onTap: () {
        setState(() {
          tweenAnimationBuilder = !tweenAnimationBuilder;
        });
      },
      child: TweenAnimationBuilder(
        duration: const Duration(seconds: 10),
        // curve: Curves.bounceIn,
        // tween: Tween<double>(begin: 0, end: 100),
        tween: Tween(
            // begin: const Offset(0, 10), end: const Offset(100, 100)),
            end: tweenAnimationBuilder ? 10.0 : 20.0),
        builder: (context, value, child) {
          return Transform.rotate(
            angle: value * 2 * 3.14,
            // scale: value,
            // offset: Offset(0, value * 2),
            // offset: value,
            child: Container(
              width: 100.w,
              height: 100.w,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.all(Radius.circular(5.w)),
              ),
              child: Center(
                child: Text(
                  'TweenAnimationBuilder',
                  style: TextStyle(fontSize: value.sp),
                ),
              ),
            ),
          );
        },
        // child: Container(
        //   width: 100.w,
        //   height: 100.w,
        //   decoration: BoxDecoration(
        //     color: Colors.yellow,
        //     borderRadius: BorderRadius.all(Radius.circular(5.w)),
        //   ),
        //   child: Text(''),
        // ),
      ),
    );
  }

  Widget animatedOpacityPadding() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              opacity = opacity == 0.1 ? 0.9 : 0.1;
            });
          },
          child: AnimatedOpacity(
            opacity: opacity,
            duration: const Duration(seconds: 1),
            curve: Curves.bounceInOut,
            child: Container(
              width: 100.w,
              height: 100.w,
              decoration: BoxDecoration(
                color: Colors.pink,
                borderRadius: BorderRadius.all(Radius.circular(5.w)),
              ),
              child: const Center(child: Text("Animated\nOpacity")),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              top = top == 0 ? 100 : 0;
            });
          },
          child: AnimatedPadding(
            padding: EdgeInsets.only(top: top),
            duration: const Duration(seconds: 1),
            curve: Curves.bounceOut,
            child: Container(
              width: 100.w,
              height: 100.w,
              decoration: BoxDecoration(
                color: Colors.pink,
                borderRadius: BorderRadius.all(Radius.circular(5.w)),
              ),
              child: const Center(child: Text("Animated\nPadding")),
            ),
          ),
        )
      ],
    );
  }

  GestureDetector gestureDetector() {
    return GestureDetector(
      onTap: () {
        setState(() {
          crossFadeState = (crossFadeState == CrossFadeState.showFirst)
              ? CrossFadeState.showSecond
              : CrossFadeState.showFirst;
        });
      },
      child: AnimatedCrossFade(
        duration: const Duration(seconds: 1),
        firstChild: const FlutterLogo(
          size: 50,
        ),
        secondChild: const FlutterLogo(
          size: 100,
        ),
        crossFadeState: crossFadeState,
      ),
    );
  }

  Widget animatedSwitcher() {
    return GestureDetector(
      onTap: () {
        setState(() {
          animatedSwitcherText =
              animatedSwitcherText == 'Flutter' ? 'Animation' : 'Flutter';
        });
      },
      child: AnimatedContainer(
        width: 100.w,
        height: 100.w,
        color: Colors.orange,
        duration: const Duration(seconds: 1),
        child: AnimatedSwitcher(
            duration: const Duration(seconds: 3),
            // child: CircularProgressIndicator(),
            // child: Image.network('https://picsum.photos/200'),
            // key: ValueKey(),
            transitionBuilder: (child, animation) {
              // return FadeTransition(
              // return RotationTransition(
              return FadeTransition(
                opacity: animation,
                child: ScaleTransition(
                  // opacity: animation,
                  // turns: animation,
                  scale: animation,
                  child: child,
                ),
              );
            },
            child: Text(
              animatedSwitcherText,
              key: UniqueKey(),
              style: TextStyle(fontSize: 20.sp),
            )),
      ),
    );
  }

  GestureDetector animatedContainer() {
    return GestureDetector(
      onTap: () {
        setState(() {
          boxWidth = (boxWidth == 150) ? 100 : 150;
          boxHeight = (boxHeight == 150) ? 100 : 150;
          boxColor = (boxWidth == 150) ? Colors.green : Colors.blue;
        });
      },
      child: AnimatedContainer(
        decoration: BoxDecoration(
          color: boxColor,
          borderRadius: BorderRadius.circular(50.w),
          // boxShadow: const [BoxShadow(blurRadius: 10, color: Colors.white)],
        ),
        width: boxWidth,
        height: boxHeight,
        duration: const Duration(seconds: 1),
        child: Center(
          child: Text('AnimatedContainer', style: TextStyle(fontSize: 14.sp)),
        ),
      ),
    );
  }
}
