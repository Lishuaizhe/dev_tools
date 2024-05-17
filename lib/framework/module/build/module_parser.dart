import 'package:analyzer/dart/element/element.dart' show Element;
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

class ModuleInfo {
  final Uri uri;
  final String className;
  final String name;
  final int priority;

  ModuleInfo(this.uri, this.className, this.name, this.priority);

  String getSignature() {
    return '$className(priority:$priority),';
  }

  String getImport() {
    return "import '$uri';\n";
  }
}

class ModuleParser {
  //注解的url参数，跟类名的映射map
  Map<String, ModuleInfo> moduleMap = {};

  //被注解的类的实际路径的存储list
  List<String> importList = [];

  void parseModule(
    Element element,
    ConstantReader annotation,
    BuildStep _,
  ) {
    final className = element.name;
    final priorityValue = annotation.read('priority').literalValue! as int;
    final uri = element.source?.uri;
    if (uri == null || className == null) {
      throw StateError(
        'type error',
      );
    }

    if (moduleMap.containsKey(className)) {
      throw StateError(
        'module class exist',
      );
    }
    moduleMap[className] = ModuleInfo(uri, className, className, priorityValue);
  }

  String genSource(
    Element element,
    ConstantReader _,
  ) {
    final List<ModuleInfo> list = moduleMap.values.toList();

    final packageRoot = element.source?.uri.path.split('/').first;

    list.sort((ModuleInfo a, ModuleInfo b) {
      if (a.priority < b.priority) {
        return -1;
      } else if (a.priority > b.priority) {
        return 1;
      }

      return 0;
    });

    final name = '\$${element.name}';
    final importStr = list
        .map((e) => e.getImport())
        .reduce((value, element) => value = '$value$element');
    final declareStr = list
        .map((e) => e.getSignature())
        .reduce((value, element) => value = '$value\n$element');
    final basePackageValue =
        'package:$packageRoot/framework/module/module.dart';

    return '''
import '$basePackageValue';
$importStr    
final List<Module> $name = [
$declareStr
];
''';
  }
}
