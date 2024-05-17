import 'package:dev_tools/router/app_router.dart';
import 'package:dev_tools/router/routes.dart';
import 'package:get/get.dart';

import 'state.dart';

class ToolsLogic extends GetxController {
  final ToolsState state = ToolsState();

  void goMap() {
    AppRouter.push(Routes.a_map);
  }
}
