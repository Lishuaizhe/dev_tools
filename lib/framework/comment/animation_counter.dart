import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnimationCounter extends StatelessWidget {
  final double value;
  final Duration duration;

  const AnimationCounter({
    super.key,
    required this.value,
    required this.duration,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 35.w,
      height: 50.w,
      child: TweenAnimationBuilder(
        duration: duration,
        tween: Tween<double>(end: value),
        builder: (context, value, child) {
          var whole = value ~/ 1; //取整
          var decimal = value - whole; //小数
          return Stack(children: [
            Positioned(
              top: -100 * decimal,
              child: Opacity(
                opacity: 1 - decimal,
                child: Text(
                  '$whole',
                  style: const TextStyle(fontSize: 40, color: Colors.black),
                ),
              ),
            ),
            Positioned(
              top: 100 - decimal * 100,
              child: Opacity(
                opacity: decimal,
                child: Text(
                  '${whole + 1}',
                  style: const TextStyle(fontSize: 40, color: Colors.black),
                ),
              ),
            ),
          ]);
        },
      ),
    );
  }
}
