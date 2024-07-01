import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';

class DevConfigUtils {

  ///默认主题色
  static BrnAllThemeConfig defaultAllConfig = BrnAllThemeConfig(
    commonConfig: defaultCommonConfig,
    dialogConfig: defaultDialogConfig,
    buttonConfig: BrnButtonConfig(),
  );

  /// 全局配置
  static BrnCommonConfig defaultCommonConfig = BrnCommonConfig(
    ///品牌色
    // brandPrimary: Colors.blueAccent,
    brandPrimary: Colors.yellow,
  );

  /// Dialog配置
  static BrnDialogConfig defaultDialogConfig = BrnDialogConfig(
    radius: 12.0,
    backgroundColor: Colors.white,
  );
}
