import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';

class DevConfigUtils {

  ///默认主题色
  static BrnAllThemeConfig defaultAllConfig = BrnAllThemeConfig(
    commonConfig: defaultCommonConfig,
    dialogConfig: defaultDialogConfig,
  );

  /// 全局配置
  static BrnCommonConfig defaultCommonConfig = BrnCommonConfig(
    ///品牌色
    brandPrimary: Colors.blueAccent,
    // brandAuxiliary: Colors.greenAccent,
  );

  /// Dialog配置
  static BrnDialogConfig defaultDialogConfig = BrnDialogConfig(
    radius: 12.0,
  );
}
