import 'package:dev_tools/framework/comment/en_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'information_details_logic.dart';
import 'information_details_state.dart';

/// @description:
/// @author
/// @date: 2024-06-03 13:18:06
class InformationDetailsPage extends StatelessWidget {
  final InformationDetailsLogic logic = Get.put(InformationDetailsLogic());
  final InformationDetailsState state =
      Get.find<InformationDetailsLogic>().state;

  InformationDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('InformationDetailsPage'),
      ),
      body: const SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            EnImage.network(
              imageUrl: 'https://picsum.photos/1000',
              fit: BoxFit.cover,
            ),
            Center(
              child: Text('InformationDetailsPage'),
            ),
          ],
        ),
      ),
    );
  }
}
