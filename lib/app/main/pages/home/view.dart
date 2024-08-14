import 'package:bruno/bruno.dart';
import 'package:dev_tools/app/about/pages/about_home/about_home_view.dart';
import 'package:dev_tools/app/information/pages/information_home/information_home_view.dart';
import 'package:dev_tools/ui/icons/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../knowledge/pages/knowledge_home/knowledge_home_view.dart';
import '../../../video/pages/video_home/video_home_view.dart';
import 'logic.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final logic = Get.find<HomeLogic>();
  final state = Get.find<HomeLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _bodyWidget(),
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }

  Widget _bodyWidget() {
    return SafeArea(
      top: false,
      bottom: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: logic.pageController,
              onPageChanged: logic.onPageChanged,
              children: [
                KnowledgeHomePage(),
                VideoHomePage(),
                InformationHomePage(),
                AboutHomePage(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Row idText(double h) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          DNUIconFont.zan,
          size: h,
          color: const Color(0xFF9097A5),
        ),
        SizedBox(
          width: h,
          height: h,
          child: Image.asset(
            'assets/images/main/good_one.png',
            fit: BoxFit.fill,
          ),
        ),
      ],
    );
  }

  Widget _bottomNavigationBar() {
    return Obx(() {
      return BrnBottomTabBar(
        currentIndex: state.tagIndex.value,
        // type: BrnBottomTabBarDisplayType.shifting,
        onTap: logic.onBottomTabBarTap,
        isAnimation: false,
        items: [
          BrnBottomTabBarItem(
            icon: _botBarImage(
              labelImage: state.tagIndex.value != 0 ? 'chat' : 'chat_selected',
            ),
            title: const Text("聊天"),
          ),
          BrnBottomTabBarItem(
            icon: _botBarImage(
              labelImage:
                  state.tagIndex.value != 1 ? 'contact' : 'contact_selected',
            ),
            title: const Text("视频"),
          ),
          BrnBottomTabBarItem(
            icon: _botBarImage(
              labelImage: state.tagIndex.value != 2 ? 'find' : 'find_selected',
            ),
            title: const Text("发现"),
          ),
          BrnBottomTabBarItem(
            icon: _botBarImage(
              labelImage: state.tagIndex.value != 3 ? 'mine' : 'mine_selected',
            ),
            title: const Text("自己"),
          ),
        ],
      );
    });
  }

  Widget _botBarImage({String? labelImage}) {
    return SizedBox(
      width: 30.w,
      height: 30.w,
      child: Image.asset('assets/images/main/$labelImage.png'),
    );
  }
}

/*
  CurvedNavigationBar buildCurvedNavigationBar() {
    return CurvedNavigationBar(
      index: 2,
      backgroundColor: Colors.white,
      color: Colors.transparent,
      buttonBackgroundColor: Colors.transparent,
      items: [
        _curvedNavigationBarItem(labelImage: 'chat', labelText: '聊天'),
        _curvedNavigationBarItem(labelImage: 'contact', labelText: '视频'),
        _curvedNavigationBarItem(
          labelImage: 'ic_pub_normal',
          labelText: '发布',
          width: 60.w,
          height: 60.w,
        ),
        _curvedNavigationBarItem(labelImage: 'find', labelText: '发现'),
        _curvedNavigationBarItem(labelImage: 'mine', labelText: '我的'),
      ],
      height: 70,
      letIndexChange: (index) {
        logic.pageController.jumpToPage(index);
        return false;
      },
      animationCurve: Curves.easeIn,
      animationDuration: const Duration(milliseconds: 300),
    );
  }


  Widget _bottomNavigationBar() {
    return Obx(() {
      return BrnBottomTabBar(
        currentIndex: state.tagIndex.value,
        // type: BrnBottomTabBarDisplayType.shifting,
        onTap: logic.onBottomTabBarTap,
        isAnimation: false,
        items: [
          BrnBottomTabBarItem(
            icon: _botBarImage(
              labelImage: state.tagIndex.value != 0 ? 'chat' : 'chat_selected',
            ),
            title: const Text("聊天"),
          ),
          BrnBottomTabBarItem(
            icon: _botBarImage(
              labelImage:
                  state.tagIndex.value != 1 ? 'contact' : 'contact_selected',
            ),
            title: const Text("视频"),
          ),
          BrnBottomTabBarItem(
            icon: _botBarImage(
              labelImage: state.tagIndex.value != 2 ? 'find' : 'find_selected',
            ),
            title: const Text("发现"),
          ),
          BrnBottomTabBarItem(
            icon: _botBarImage(
              labelImage: state.tagIndex.value != 3 ? 'mine' : 'mine_selected',
            ),
            title: const Text("自己"),
          ),
        ],
      );
    });
  }

  Widget _botBarImage({String? labelImage}) {
    return SizedBox(
      width: 30.w,
      height: 30.w,
      child: Image.asset('assets/images/main/$labelImage.png'),
    );
  }
}

/*
  CurvedNavigationBar buildCurvedNavigationBar() {
    return CurvedNavigationBar(
      index: 2,
      backgroundColor: Colors.white,
      color: Colors.transparent,
      buttonBackgroundColor: Colors.transparent,
      items: [
        _curvedNavigationBarItem(labelImage: 'chat', labelText: '聊天'),
        _curvedNavigationBarItem(labelImage: 'contact', labelText: '视频'),
        _curvedNavigationBarItem(
          labelImage: 'ic_pub_normal',
          labelText: '发布',
          width: 60.w,
          height: 60.w,
        ),
        _curvedNavigationBarItem(labelImage: 'find', labelText: '发现'),
        _curvedNavigationBarItem(labelImage: 'mine', labelText: '我的'),
      ],
      height: 70,
      letIndexChange: (index) {
        logic.pageController.jumpToPage(index);
        return false;
      },
      animationCurve: Curves.easeIn,
      animationDuration: const Duration(milliseconds: 300),
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

  _curvedNavigationBarItem({
    String? labelImage,
    String? labelText,
    double? height,
    double? width,
  }) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          SizedBox(
            width: width ?? 30.w,
            height: height ?? 30.w,
            child: Image.asset('assets/images/main/$labelImage.png'),
          ),
          if (height == null) Text('$labelText'),
        ],
      ),
    );
  }

  FloatingActionButton _floatingActionButton() {
    return FloatingActionButton(
      backgroundColor: Colors.white,
      onPressed: () {},
      tooltip: 'Increment',
      child: const Icon(Icons.add),
    );
  }
*/
