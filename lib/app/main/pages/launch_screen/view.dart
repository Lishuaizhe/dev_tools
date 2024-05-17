import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class LaunchScreenPage extends StatelessWidget {
  LaunchScreenPage({Key? key}) : super(key: key);

  final logic = Get.find<LaunchScreenLogic>();
  final state = Get.find<LaunchScreenLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
