import 'package:bruno/bruno.dart';
import 'package:dev_tools/app/my/pages/my/view.dart';
import 'package:dev_tools/app/one/pages/one/view.dart';
import 'package:dev_tools/app/tools/pages/tools/view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
        // physics: const NeverScrollableScrollPhysics(),
        controller: logic.pageController,
        onPageChanged: logic.onPageChanged,
        children: [
          OnePage(),
          ToolsPage(),
          MyPage(),
        ],
      ),
    );
  }

  Widget _bottomNavigationBar() {
    return Obx(() {
      return BrnBottomTabBar(
        fixedColor: Colors.blueAccent,
        currentIndex: state.tagIndex.value,
        onTap: logic.onBottomTabBarTap,
        isAnimation: true,
        items: state.tabItems,
      );
    });
  }
}
