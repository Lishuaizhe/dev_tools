import 'package:dev_tools/router/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'app/main/pages/unknown_route/binding.dart';
import 'app/main/pages/unknown_route/view.dart';
import 'bootstrap/app.dart';
import 'config/brn_localization_delegate.dart';
import 'config/theme_data_app.dart';
import 'utils/log.dart';

void main() {
  runAppLocation(() {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return _screenUtilInit(
      child: GetMaterialApp(
        title: 'FlutterDevs',
        theme: ThemeDateApp.lightTheme,
        darkTheme: ThemeDateApp.darkTheme,
        initialRoute: Routes.home,
        getPages: AppContext.to.routers,
        unknownRoute: _unknownRoute(),
        debugShowCheckedModeBanner: false,
        localizationsDelegates: _localizationsDelegates(),
        logWriterCallback: _logWriterCallback,
        onReady: _onReady,
      ),
    );
  }

  /// 屏幕适配组件
  Widget _screenUtilInit({Widget? child}) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      splitScreenMode: true,
      minTextAdapt: true,
      child: child,
    );
  }

  /// 找不到页面的处理
  GetPage _unknownRoute() {
    return GetPage(
      name: Routes.notFound,
      page: () => UnknownRoutePage(),
      binding: UnknownRouteBinding(),
    );
  }

  //语言设置
  _localizationsDelegates() {
    return [
      MyBrnLocalizationDelegate(),
    ];
  }

  //日志输出
  _logWriterCallback(String text, {bool isError = false}) {
    if (isError) {
      Log.e(text);
    } else {
      Log.i(text);
    }
  }

  void _onReady() {
    AppContext.to.setAppReady();
  }
}
