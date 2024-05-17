import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class UnknownRoutePage extends StatelessWidget {
  UnknownRoutePage({super.key});

  final logic = Get.find<UnknownRouteLogic>();
  final state = Get.find<UnknownRouteLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page Not Found'),
      ),
      body: const Center(
        child: Column(
          children: [
            // BrnAbnormalStateWidget(
            //   title: 'Page Not Found',
            //   action: (int index) {
            //     print(index);
            //   },
            // )
          ],
        ),
      ),
    );
  }
}
