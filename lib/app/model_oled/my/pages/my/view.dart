import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class MyPage extends StatelessWidget {
  MyPage({super.key});

  final logic = Get.find<MyLogic>();
  final state = Get.find<MyLogic>().state;

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('我的'));
  }
}
