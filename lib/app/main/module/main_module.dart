import 'package:dev_tools/config/module_priority.dart';
import 'package:dev_tools/framework/module/build/annotations.dart';
import 'package:dev_tools/framework/module/module.dart';
import 'package:dev_tools/router/routes.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../pages/home/binding.dart';
import '../pages/home/view.dart';

/// FileName: main_module.dart
///
/// @Date: 2024-05-11 09:16:27
/// @Description:

@AppModule(priority: modulePriorityDefault)
class MainModule extends Module {
  MainModule({super.priority}) : super(name: "main");

  @override
  List<GetPage> getRouters() {
    return <GetPage>[
      homeBinding(),
    ];
  }

  GetPage homeBinding() => GetPage(
        name: Routes.home,
        page: () => HomePage(),
        binding: HomeBinding(),
      );
}
