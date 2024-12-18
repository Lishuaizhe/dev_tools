import 'package:dev_tools/config/module_priority.dart';
import 'package:dev_tools/framework/module/build/annotations.dart';
import 'package:dev_tools/framework/module/module.dart';

/// FileName: video_module.dart
///
/// @Date: 2024-07-04 15:18:27
/// @Description:

@AppModule(priority: modulePriorityDefault)
class VideoModule extends Module {
   VideoModule({ super.priority})
      : super(name: "video");
}
