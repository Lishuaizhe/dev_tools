import 'package:get/get_navigation/src/routes/get_route.dart';
import 'application_lifecycle.dart';
import 'database_handler.dart';
import 'push_handler.dart';
import 'sync_handler.dart';

class Module {
  ///模块名
  final String? name;

  ///优先级，主要影响模块中方法的调用顺序
  final int priority;

  ///处理数据库相关操作，默认为空
  final DatabaseHandler? databaseHandler;

  /// 处理App启动操作，默认为空
  final ApplicationLifecycle? applicationLifecycle;

  /// 处理推送消息，默认为空
  final PushHandler? pushHandler;

  /// 处理同步事件，默认为空
  final SyncHandler? syncHandler;

  /// 返回当前模块的页面路由信息
  List<GetPage> getRouters() {
    return <GetPage>[];
  }

  @override
  String toString() {
    return 'Module {name: $name}';
  }

  Module({
    this.name,
    this.priority = 0,
    this.databaseHandler,
    this.applicationLifecycle,
    this.pushHandler,
    this.syncHandler,
  });
}
