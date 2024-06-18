import 'package:dev_tools/config/module_priority.dart';
import 'package:dev_tools/framework/module/build/annotations.dart';
import 'package:dev_tools/framework/module/module.dart';
import 'package:get/get.dart';

/// FileName: tools_module.dart
///
/// @Date: 2024-05-11 14:27:59
/// @Description:

@AppModule(priority: modulePriorityDefault)
class ToolsModule extends Module {
  ToolsModule({super.priority}) : super(name: "tools");

  @override
  List<GetPage> getRouters() {
    return [
      // _flutterAnimation(),
    ];
  }

  // GetPage _flutterAnimation() {
  //   return GetPage(
  //     // name: Routes.flutterAnimation,
  //     page: () => FlutterAnimationPage(),
  //   );
  // }
}
