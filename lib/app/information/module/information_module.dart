import 'package:dev_tools/app/information/pages/information_details/information_details_view.dart';
import 'package:dev_tools/app/information/pages/information_search/information_search_view.dart';
import 'package:dev_tools/config/module_priority.dart';
import 'package:dev_tools/framework/module/build/annotations.dart';
import 'package:dev_tools/framework/module/module.dart';
import 'package:dev_tools/router/routes.dart';
import 'package:get/get.dart';

import '../pages/information_add/information_add_view.dart';

/// FileName: information_module.dart
///
/// @Date: 2024-06-03 09:37:19
/// @Description:
@AppModule(priority: modulePriorityDefault)
class InformationModule extends Module {
  InformationModule({super.priority}) : super(name: "information");

  @override
  List<GetPage> getRouters() {
    return [
      _informationDetails(),
      _informationAdd(),
      _informationSearch(),
    ];
  }

  GetPage _informationDetails() {
    return GetPage(
      name: Routes.informationDetails,
      page: () => InformationDetailsPage(),
    );
  }

  GetPage _informationAdd() {
    return GetPage(
      name: Routes.informationAdd,
      page: () => InformationAddPage(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 600),
    );
  }

  GetPage _informationSearch() {
    return GetPage(
      name: Routes.informationSearch,
      page: () => InformationSearchPage(),
      transition: Transition.zoom,
      transitionDuration: const Duration(milliseconds: 600),
    );
  }
}
