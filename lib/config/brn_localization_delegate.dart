import 'dart:ui';

import 'package:bruno/bruno.dart';

/// 固定组件库使用中文
class MyBrnLocalizationDelegate extends BrnLocalizationDelegate {
  @override
  Future<BrnIntl> load(Locale locale) {
    return super.load(const Locale('zh', 'Hans_CN'));
  }
}
