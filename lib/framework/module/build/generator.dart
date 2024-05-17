import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import 'annotations.dart';
import 'module_parser.dart';

class AppModuleGenerator extends GeneratorForAnnotation<AppModule> {
  static ModuleParser moduleParser = ModuleParser();

  @override
  generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) {
    moduleParser.parseModule(element, annotation, buildStep);
  }
}

class AppModuleListGenerator extends GeneratorForAnnotation<AppModuleList> {
  @override
  generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) {
    return AppModuleGenerator.moduleParser.genSource(element, annotation);
  }
}
