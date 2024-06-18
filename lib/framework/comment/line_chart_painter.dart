import 'package:dev_tools/app/knowledge/mock/data_point.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LineChartPainter extends CustomPainter {
  final List<DataPoint> dataPoints;

  LineChartPainter(this.dataPoints);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 1.w
      ..style = PaintingStyle.stroke;

    // 绘制背景
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Paint()..color = Colors.transparent,
    );

    // 绘制网格
    drawGrid(canvas, size, dataPoints.length);

    // 绘制折线图
    drawLineChart(canvas, size, paint);
  }

  void drawGrid(Canvas canvas, Size size, int count) {
    final gridPaint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 0.1;

    final int gridCount = count;
    final double stepX = size.width / gridCount;
    final double stepY = size.height / gridCount;

    for (int i = 0; i <= gridCount; i++) {
      // 垂直线
      canvas.drawLine(
          Offset(stepX * i, 0), Offset(stepX * i, size.height), gridPaint);

      // 水平线
      canvas.drawLine(
          Offset(0, stepY * i), Offset(size.width, stepY * i), gridPaint);

      // 绘制Y轴
      drawText(canvas, Offset(-10.w, (stepY * i) - 7.w), '${(gridCount - i)}');
      if (i == 0) continue;
      // 绘制X轴
      drawText(canvas, Offset((stepX * i) - 5.w, size.height), '$i');
    }
  }

  void drawLineChart(Canvas canvas, Size size, Paint paint) {
    if (dataPoints.isEmpty) return;

    final path = Path();
    final scaleX = size.width / (dataPoints.length - 1);
    final scaleY = size.height /
        (dataPoints.map((e) => e.y).reduce((a, b) => a > b ? a : b));

    path.moveTo(
        dataPoints[0].x * scaleX, size.height - dataPoints[0].y * scaleY);

    for (int i = 1; i < dataPoints.length; i++) {
      path.lineTo(
          dataPoints[i].x * scaleX, size.height - dataPoints[i].y * scaleY);
    }

    canvas.drawPath(path, paint);
  }

  void drawText(Canvas canvas, Offset position, String text) {
    final textStyle = TextStyle(
      color: Colors.black,
      fontSize: 12.sp,
    );
    final textSpan = TextSpan(
      text: text,
      style: textStyle,
    );
    final textPainter = TextPainter(
      text: textSpan,
      textAlign: TextAlign.left,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    textPainter.paint(canvas, position);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

// child: SingleChildScrollView(s: CrossAxisAlignment.start, children: [
// Obx(() {
//   return Column(
//     children: state.listDate.map((e) {
//       return Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Text(e.toString()),
//       );
//     }).toList(),
//   );
// }),
// ]),

// Row(
//   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//   children: [
//     AnimationCounter(
//         value: 5, duration: Duration(seconds: 1)),
//     AnimationCounter(
//         value: 5, duration: Duration(seconds: 1)),
//     AnimationCounter(
//         value: 5, duration: Duration(seconds: 1)),
//     AnimationCounter(
//         value: 5, duration: Duration(seconds: 1)),
//     AnimationCounter(
//         value: 5, duration: const Duration(seconds: 1)),
//   ],
// ),
