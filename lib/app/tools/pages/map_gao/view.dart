import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class MapGaoPage extends StatelessWidget {
  MapGaoPage({super.key});

  final logic = Get.find<MapGaoLogic>();
  final state = Get.find<MapGaoLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container());
  }
}
