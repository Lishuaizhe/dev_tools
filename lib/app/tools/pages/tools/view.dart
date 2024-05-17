import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class ToolsPage extends StatelessWidget {
  ToolsPage({super.key});

  final logic = Get.find<ToolsLogic>();
  final state = Get.find<ToolsLogic>().state;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BrnBigMainButton(title: '高德地图',onTap: logic.goMap,),
        ],
      ),
    );
  }
}
