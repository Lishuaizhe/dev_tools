import 'package:dev_tools/app/tools/pages/map_gao/view.dart';
import 'package:dev_tools/config/module_priority.dart';
import 'package:dev_tools/framework/module/build/annotations.dart';
import 'package:dev_tools/framework/module/module.dart';
import 'package:dev_tools/router/routes.dart';
import 'package:get/get.dart';

import '../pages/map_gao/binding.dart';

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
      aMapPage(),
    ];
  }

  GetPage aMapPage() {
    return GetPage(
      name: Routes.a_map,
      page: () => MapGaoPage(),
      binding: MapGaoBinding(),
    );
  }
}
