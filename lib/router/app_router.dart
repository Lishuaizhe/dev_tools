import 'package:get/get.dart';

class AppRouter {

  /// 已经打开的路由堆栈
  static List<String> history = [];

  /// 登录当前页面
  static Future<T?>? replace<T>(
    String name, {
    dynamic arguments,
    int? id,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
  }) {
    return Get.offNamed(
      name,
      parameters: parameters,
      id: id,
      preventDuplicates: preventDuplicates,
      arguments: arguments,
    );
  }

  /// 打开新页面
  static Future<T?>? push<T>(
    String page, {
    dynamic arguments,
    int? id,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
  }) {
    return Get.toNamed(
      page,
      parameters: parameters,
      id: id,
      preventDuplicates: preventDuplicates,
      arguments: arguments,
    );
  }

  ///返回
  static void back<T>({
    T? result,
    bool closeOverlays = false,
    bool canPop = true,
    int? id,
  }) {
    return Get.back(
      result: result,
      closeOverlays: closeOverlays,
      canPop: canPop,
      id: id,
    );
  }

  //获取页面总量
  static int pageNum() {
    return history.length;
  }

  /// 当前堆栈返回到主界面
  static void backToRoot() {
    Get.close(pageNum() - 1);
  }



}
