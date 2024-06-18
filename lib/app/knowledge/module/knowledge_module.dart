import 'package:dev_tools/config/module_priority.dart';
import 'package:dev_tools/framework/module/build/annotations.dart';
import 'package:dev_tools/framework/module/module.dart';

/// FileName: knowledge_module.dart
///
/// @Date: 2024-06-03 09:28:44
/// @Description:

@AppModule(priority: modulePriorityDefault)
class KnowledgeModule extends Module {
   KnowledgeModule({ int priority = 0})
      : super(name: "knowledge", priority: priority);
}
