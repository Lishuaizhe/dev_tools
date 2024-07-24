import 'dart:ui';

class AppThemeColor {
  /*主题色*/
  static const Color colorTheme01 = Color(0xFF8A72FF);
  static const Color colorTheme02 = Color(0xFF2FA9FD);
  static const Color colorTheme03 = Color(0xFF12C8C9);

  /*通用颜色*/
  static const Color colorError = Color(0xFFF55871);
  static const Color colorWarn = Color(0xFFFFA033);
  static const Color colorSuccess = Color(0xFF21A380);

  /*背景颜色*/
  static const Color colorBGPrimary = Color(0xFFEBEEF5);
  static const Color colorBGSecondary = Color(0xFFF5F5F5);
  static const Color colorBGTertiary = Color(0xFFFFFFFF);
  static const Color colorBGHover = Color(0xFFF5F8FF);
  static const Color colorBGInput = Color(0xFFEFEFEF);
  static const Color colorBGMask = Color(0xB3000000);

  /*分割颜色*/
  static const Color colorSeparator = Color(0xFFE1E8F5);

  /*文字颜色*/
  static const Color colorTPrimary = Color(0xFF333333);
  static const Color colorTSecondary = Color(0xFF4E5666);
  static const Color colorTTertiary = Color(0xFFADB2C0);
  static const Color colorTButton = Color(0xFF1C98ED);

  /*其他颜色*/
  static const Color colorOther = Color(0xFF8992A3);

  //按钮渐变色
  static const List<Color> btnColors = [
    Color(0xFF8A72FF),
    Color(0xFF2FA9FD),
    Color(0xFF12C8C9),
  ];

  // 不可点击按钮颜色
  static const List<Color> btnDisableColors = [
    Color(0xFFC4B9FF),
    Color(0xFF97D4FE),
    Color(0xFF89E3E5),
  ];
}
