import 'package:dev_tools/config/module_priority.dart';
import 'package:dev_tools/framework/module/build/annotations.dart';
import 'package:dev_tools/framework/module/module.dart';

/// FileName: about_module.dart
///
/// @Date: 2024-06-03 09:37:43
/// @Description:

@AppModule(priority: modulePriorityDefault)
class AboutModule extends Module {
   AboutModule({ super.priority})
      : super(name: "about");



}
