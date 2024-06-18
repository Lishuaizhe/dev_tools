import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class ActivityIndicators extends StatelessWidget {
  String title;
  String value;
  String uitls;
  Color color;

  ActivityIndicators({
    required this.title,
    required this.value,
    required this.uitls,
    this.color = Colors.red,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: color,
            )),
        Text(
          value,
          style: TextStyle(
            fontSize: 18.sp,
            color: Colors.black,
          ),
        ),
        Text(uitls,
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.grey,
            )),
        SizedBox(height: 20.h)
      ],
    );
  }
}
