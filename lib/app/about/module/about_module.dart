import 'package:dev_tools/config/module_priority.dart';
import 'package:dev_tools/framework/module/build/annotations.dart';
import 'package:dev_tools/framework/module/module.dart';

/// FileName: about_module.dart
///
/// @Date: 2024-06-03 09:37:43
/// @Description:

@AppModule(priority: modulePriorityDefault)
class AboutModule extends Module {
   AboutModule({ int priority = 0})
      : super(name: "about", priority: priority);



}
