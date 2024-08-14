import 'package:dev_tools/resource/theme_colors.dart';
import 'package:flutter/material.dart';

class ThemeDateApp {
  /// 亮色主题
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,
    primaryColor: AppThemeColor.colorTheme01,
    primaryColorLight: AppThemeColor.colorTheme01,
    buttonTheme: ButtonThemeData(
      buttonColor: AppThemeColor.colorTheme01,
      textTheme: ButtonTextTheme.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    // colorScheme: ColorScheme.fromSeed(
      // seedColor: Colors.white,
      // primary: Colors.orange,
      // brightness: Brightness.light,
    // ),
  );

  /// 暗色主题
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.orange,
      primary: Colors.orange,
      brightness: Brightness.dark,
    ),
  );
}
