
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';

/// 监听控件左侧滑动但不监听其他事件的手势探测器
class CustomGestureDetector extends StatefulWidget {
  final Widget child;
  final VoidCallback onLeftSwipe; // 回调函数


  const CustomGestureDetector({super.key, required this.child, required this.onLeftSwipe});

  @override
  State<CustomGestureDetector> createState() => _CustomGestureDetectorState();
}

class _CustomGestureDetectorState extends State<CustomGestureDetector> {
  @override
  Widget build(BuildContext context) {
    return RawGestureDetector(
      gestures: {
        CustomHorizontalDragGestureRecognizer:
        GestureRecognizerFactoryWithHandlers<
            CustomHorizontalDragGestureRecognizer>(
              () => CustomHorizontalDragGestureRecognizer(onLeftSwipe: widget.onLeftSwipe),
              (CustomHorizontalDragGestureRecognizer instance) {
            instance.onStart = instance.onStartDrag;
            instance.onUpdate = instance.onUpdateDrag;
            instance.onEnd = instance.onEndDrag;
          },
        ),
      },
      child: widget.child,
    );
  }
}

class CustomHorizontalDragGestureRecognizer
    extends HorizontalDragGestureRecognizer {
  final VoidCallback onLeftSwipe; // 回调函数
  double initialX = 0.0;
  bool hasTriggered = false;
  static const double threshold = 150.0; // 触发左滑事件的阈值距离

  CustomHorizontalDragGestureRecognizer({required this.onLeftSwipe});

  void onStartDrag(DragStartDetails details) {
    initialX = details.globalPosition.dx;
    hasTriggered = false;
  }

  void onUpdateDrag(DragUpdateDetails details) {
    if (!hasTriggered) {
      double deltaX = initialX - details.globalPosition.dx;
      if (deltaX > threshold) {
        hasTriggered = true;
        // 执行左滑触发后的逻辑
        onLeftSwipe(); // 触发回调函数
      }
    }
  }

  void onEndDrag(DragEndDetails details) {
    if (!hasTriggered) {
      // 在没有达到触发距离时，重置状态
      hasTriggered = false;
    }
  }

  @override
  void rejectGesture(int pointer) {
    acceptGesture(pointer); // 强制接受手势
  }
}
