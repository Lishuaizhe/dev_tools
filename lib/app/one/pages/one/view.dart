import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class OnePage extends StatelessWidget {
  OnePage({Key? key}) : super(key: key);

  final logic = Get.find<OneLogic>();
  final state = Get.find<OneLogic>().state;

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("首页"));
  }
}
