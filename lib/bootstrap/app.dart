import 'dart:async';

import 'package:bruno/bruno.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../config/config_theme_utils.dart';
import '../framework/module/build/annotations.dart';
import '../framework/module/module.dart';
import 'app.mod.dart';

@AppModuleList()
List<Module> appModuleList() {
  return $appModuleList;
}

/// 初始化App的基本信息，数据库，服务器，第三方SDK，然后启动UI
void runAppLocation(VoidCallback runApp) {
  runZonedGuarded(() async {
    initBruno();
    systemUi();
    initGetX();
    initEasyRefresh();
    _initService();
    runApp.call();
  }, (error, stack) {
    if (kDebugMode) {
      print("runMyApp error:$error, $stack");
    }
  });
}

void initEasyRefresh() {
  // EasyRefresh.defaultHeaderBuilder = () => ClassicalHeader(
  //       enableInfiniteRefresh: false,
  //       enableHapticFeedback: false,
  //       enableInfiniteLoad: false,
  //       float: false,
  //       enableControlFinishRefresh: false,
  //       completeDuration: const Duration(milliseconds: 500),
  //     );
}

void initGetX() {
  Transition? transition;
  if (GetPlatform.isAndroid) {
    // 使用Android原生动画
    transition = Transition.rightToLeft;
  } else if (GetPlatform.isIOS) {
    // 使用iOS风格的Cupertino动画
    transition = Transition.cupertino;
  }

  Get.config(
    defaultTransition: transition, //跳转样式
    enableLog: kDebugMode, //开启日志
  );
}

void systemUi() {
  if (GetPlatform.isAndroid) {
    const SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarDividerColor: Colors.black,
      systemNavigationBarColor: Colors.black,
      systemNavigationBarIconBrightness: Brightness.dark,
      systemNavigationBarContrastEnforced: false,
      systemStatusBarContrastEnforced: false,
    );
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
  /*statusBarColor: 设置状态栏的背景颜色。
statusBarBrightness: 设置状态栏图标和文字的亮度（适用于iOS）。
statusBarIconBrightness: 设置状态栏图标和文字的亮度（适用于Android）。
systemNavigationBarColor: 设置系统导航栏的背景颜色。
systemNavigationBarDividerColor: 设置系统导航栏分隔线的颜色。
systemNavigationBarIconBrightness: 设置系统导航栏图标的亮度。*/
}

Future<void> _initService() async {
  await Get.putAsync<AppContext>(() => AppContext().init());
}

void initBruno() {
  BrnInitializer.register(allThemeConfig: DevConfigUtils.defaultAllConfig);
}

class AppContext extends GetxService {
  static AppContext get to => Get.find();

  late List<Module> moduleList;
  final List<GetPage> routers = [];

  final _appReady = false.obs;

  // final _initReady = false.obs;

  Future<AppContext> init() async {
    _initModuleList(); // 初始化模块
    _initRouters(); // 初始化路由

    return this;
  }

  void _initModuleList() {
    moduleList = appModuleList();
  }

  void _initRouters() {
    for (var element in moduleList) {
      final List<GetPage> list = element.getRouters();
      if (list.isNotEmpty) {
        routers.addAll(list);
      }
    }
  }

  void setAppReady() {
    _appReady.value = true;
  }
}
