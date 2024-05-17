import 'package:dev_tools/config/module_priority.dart';
import 'package:dev_tools/framework/module/build/annotations.dart';
import 'package:dev_tools/framework/module/module.dart';

/// FileName: one_module.dart
///
/// @Date: 2024-05-11 14:46:25
/// @Description:

@AppModule(priority: modulePriorityDefault)
class OneModule extends Module {
   OneModule({ int priority = 0})
      : super(name: "one", priority: priority);
}
