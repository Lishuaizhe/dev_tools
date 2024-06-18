import 'package:bruno/bruno.dart';
import 'package:dev_tools/app/about/pages/about_home/about_home_view.dart';
import 'package:dev_tools/app/information/pages/information_home/information_home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../knowledge/pages/knowledge_home/knowledge_home_view.dart';
import 'logic.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final logic = Get.find<HomeLogic>();
  final state = Get.find<HomeLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _bodyWidget(),
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }

  Widget _bodyWidget() {
    return SafeArea(
      top: false,
      bottom: false,
      child: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: logic.pageController,
        onPageChanged: logic.onPageChanged,
        children: [InformationHomePage(), KnowledgeHomePage(), AboutHomePage()],
      ),
    );
  }

  Widget _bottomNavigationBar() {
    return Obx(() {
      return BrnBottomTabBar(
        currentIndex: state.tagIndex.value,
        onTap: logic.onBottomTabBarTap,
        isAnimation: true,
        items: state.tabItems,
      );
    });
  }
}
