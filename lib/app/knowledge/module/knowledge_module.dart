import 'package:dev_tools/app/knowledge/pages/meeting/meeting_view.dart';
import 'package:dev_tools/config/module_priority.dart';
import 'package:dev_tools/framework/module/build/annotations.dart';
import 'package:dev_tools/framework/module/module.dart';
import 'package:dev_tools/router/routes.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../pages/bounded_friction_demo/binding.dart';
import '../pages/bounded_friction_demo/view.dart';
import '../pages/game2048/binding.dart';
import '../pages/game2048/view.dart';
import '../pages/resource_meeting/resource_meeting_view.dart';
import '../pages/sliver_demo/sliver_demo_binding.dart';
import '../pages/sliver_demo/sliver_demo_view.dart';

/// FileName: knowledge_module.dart
///
/// @Date: 2024-06-03 09:28:44
/// @Description:

@AppModule(priority: modulePriorityDefault)
class KnowledgeModule extends Module {
  KnowledgeModule({super.priority}) : super(name: "knowledge");

  @override
  List<GetPage> getRouters() {
    return [
      GetPage(
        name: Routes.knowledge2048,
        page: () => Game2048Page(),
        binding: Game2048Binding(),
      ),
      GetPage(
        name: Routes.meeting,
        page: () => MeetingPage(),
      ),
      GetPage(
        name: Routes.resourceMeeting,
        page: () => ResourceMeetingPage(),
      ),
      GetPage(
        name: Routes.boundedFrictionDemoPage,
        page: () => const BoundedFrictionDemo(),
        // binding: BoundedFrictionDemoBinding(),
      ),
      GetPage(
        name: Routes.sliverDemoPage,
        page: () => SliverDemoPage(),
        binding: SliverDemoBinding(),
      ),
    ];
  }
}
