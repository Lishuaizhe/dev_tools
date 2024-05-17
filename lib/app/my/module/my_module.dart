import 'package:dev_tools/config/module_priority.dart';
import 'package:dev_tools/framework/module/build/annotations.dart';
import 'package:dev_tools/framework/module/module.dart';

/// FileName: my_module.dart
///
/// @Date: 2024-05-11 14:28:04
/// @Description:

@AppModule(priority: modulePriorityDefault)
class MyModule extends Module {
   MyModule({ int priority = 0})
      : super(name: "my", priority: priority);
}
