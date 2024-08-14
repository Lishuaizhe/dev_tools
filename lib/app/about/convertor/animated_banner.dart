import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AnimatedBanner extends StatefulWidget {
  const AnimatedBanner({super.key});

  @override
  AnimatedBannerState createState() => AnimatedBannerState();
}

class AnimatedBannerState extends State<AnimatedBanner>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  Timer? _hideTimer;
  String fullText = 'TIMO AI助手';
  String displayedText = '';

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(microseconds: 1000),
      vsync: this,
    );

    _controller.addListener(updateText);
    _controller.addStatusListener(handleAnimationStatus);
    _controller.forward();
  }

  void updateText() {
    final int len = (fullText.length * _controller.value).round();
    if (len != displayedText.length) {
      setState(() {
        displayedText = fullText.substring(0, len);
      });
    }
  }

  void handleAnimationStatus(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      _hideTimer = Timer(const Duration(seconds: 3), () {
        _controller.reverse();
      });
    } else if (status == AnimationStatus.dismissed) {
      _hideTimer = Timer(const Duration(seconds: 3), () {
        _controller.forward();
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _hideTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 1.w, horizontal: 5),
        decoration: BoxDecoration(
            color: const Color(0xFF2FA9FD),
            borderRadius: BorderRadius.all(Radius.circular(11.w))),
        child: IntrinsicWidth(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/knowledge/kl_lion.png',
                width: 20.w,
                height: 18.w,
              ),
              if (displayedText != '')
                Text(
                  displayedText,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10.sp,
                  ),
                ).marginOnly(left: 10),
            ],
          ),
        ),
      ),
    );
  }
}

// class AnimatedBanner extends StatefulWidget {
//   @override
//   _AnimatedBannerState createState() => _AnimatedBannerState();
// }
//
// class _AnimatedBannerState extends State<AnimatedBanner> with SingleTickerProviderStateMixin {
//   AnimationController? _controller;
//   Animation<double>? _animation;
//   Timer? _hideTimer;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       duration: Duration(seconds: 2),
//       vsync: this,
//     );
//
//     _animation = Tween<double>(begin: -1.0, end: 0.0).animate(_controller!)
//       ..addListener(() {
//         setState(() {});
//       })
//       ..addStatusListener((status) {
//         if (status == AnimationStatus.completed) {
//           _hideTimer = Timer(const Duration(seconds: 2), () {
//             _controller!.reverse();
//           });
//         } else if (status == AnimationStatus.dismissed) {
//           _controller!.forward();
//         }
//       });
//
//     _controller!.forward();
//   }
//
//   @override
//   void dispose() {
//     _controller?.dispose();
//     _hideTimer?.cancel();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final width = MediaQuery.of(context).size.width;
//
//     return Container(
//       height: 22.w,
//       width: 107.w,
//       padding: EdgeInsets.symmetric(vertical: 1.w),
//       decoration: BoxDecoration(
//           color: const Color(0xFF2FA9FD),
//           borderRadius: BorderRadius.all(Radius.circular(11.w))),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Image.asset('assets/images/knowledge/kl_lion.png')
//               .marginOnly(right: 2.w),
//           Transform.translate(
//             offset: Offset(_animation!.value * width, 0),
//             child: Text(
//               'TIMO AI助手',
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 12.sp,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class AnimatedBanner extends StatefulWidget {
//   const AnimatedBanner({super.key});
//
//   @override
//   _AnimatedBannerState createState() => _AnimatedBannerState();
// }
//
// class _AnimatedBannerState extends State<AnimatedBanner> with SingleTickerProviderStateMixin {
//   AnimationController? _controller;
//   Animation<double>? _animation;
//   Timer? _hideTimer;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       duration: const Duration(seconds: 2),
//       vsync: this,
//     );
//
//     _animation = Tween<double>(begin: -1.0, end: 0.0).animate(_controller!)
//       ..addListener(() {
//         setState(() {});
//       })
//       ..addStatusListener((status) {
//         if (status == AnimationStatus.completed) {
//           _hideTimer = Timer(const Duration(seconds: 3), () {
//             _controller!.reverse();
//           });
//         } else if (status == AnimationStatus.dismissed) {
//           _controller!.forward();
//         }
//       });
//
//     _controller!.forward();
//   }
//
//   @override
//   void dispose() {
//     _controller?.dispose();
//     _hideTimer?.cancel();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final width = MediaQuery.of(context).size.width;
//
//     return Transform.translate(
//       offset: Offset(_animation!.value * width, 0),
//       child: Container(
//         height: 22.w,
//         width: 107.w,
//         padding: EdgeInsets.symmetric(vertical: 1.w),
//         decoration: BoxDecoration(
//             color: const Color(0xFF2FA9FD),
//             borderRadius: BorderRadius.all(Radius.circular(11.w))),
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Image.asset('assets/images/knowledge/kl_lion.png')
//                 .marginOnly(right: 2.w),
//             Text(
//               'TIMO AI助手',
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 12.sp,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
