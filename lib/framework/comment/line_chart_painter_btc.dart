import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LineChartPainterNew extends CustomPainter {
  final List dateList;

  LineChartPainterNew({
    required this.dateList,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 1.w
      ..style = PaintingStyle.stroke;

    // 绘制背景
    // canvas.drawRect(
    //   Rect.fromLTWH(0, 0, size.width, size.height),
    //   Paint()..color = Colors.transparent,
    // );

    // 绘制网格
    drawGrid(canvas, size, dateList.length);

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

      // // 绘制Y轴
      // drawText(canvas, Offset(-10.w, (stepY * i) - 7.w), '${(gridCount - i)}');
      // if (i == 0) continue;
      // // 绘制X轴
      // drawText(canvas, Offset((stepX * i) - 5.w, size.height), '$i');
    }
  }

  void drawLineChart(Canvas canvas, Size size, Paint paint) {
    if (dateList.isEmpty) return;

    final path = Path();
    final scaleX = size.width / (dateList.length - 1);
    final scaleY = size.height /
        (dateList.map((e) => e.y).reduce((a, b) => a > b ? a : b));

    path.moveTo(dateList[0] * scaleX, size.height - dateList[0] * scaleY);

    for (int i = 1; i < dateList.length; i++) {
      path.lineTo(dateList[i].x * scaleX, size.height - dateList[i].y * scaleY);
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
