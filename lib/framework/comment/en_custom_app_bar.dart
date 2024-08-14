import 'package:flutter/material.dart';

class CustomAppBar {
  static PreferredSizeWidget build({
    required String title,
    List<Widget>? actions,
    PreferredSizeWidget? bottom,
    Color backgroundColor = Colors.blue,
    Color titleColor = Colors.white,
    double elevation = 4.0,
  }) {
    return AppBar(
      title: Text(
        title,
        style: TextStyle(color: titleColor),
      ),
      actions: actions,
      bottom: bottom,
      backgroundColor: backgroundColor,
      elevation: elevation,
    );
  }
}
