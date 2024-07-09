import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'sliver_demo_logic.dart';

class SliverDemoPage extends StatelessWidget {
  SliverDemoPage({super.key});

  final logic = Get.find<SliverDemoLogic>();
  final state = Get.find<SliverDemoLogic>().state;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        body: SizedBox(
          width: double.infinity,
          // child: buildSingleChildScrollView(),
          child: buildCustomScrollView(),
        ),
      ),
    );
  }

  CustomScrollView buildCustomScrollView() {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: 200.0,
          floating: false,
          pinned: true,
          snap: false,
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
            title: const Text(
              'Expanded Title',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
              ),
            ),
            background: Image.network(
              'https://via.placeholder.com/350x150',
              fit: BoxFit.cover,
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return ListTile(
                title: Text('Item #$index'),
              );
            },
            childCount: 10,
          ),
        ),
        SliverGrid(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 每行显示的列数
            mainAxisSpacing: 10.0, // 主轴方向（竖直）的间距
            crossAxisSpacing: 10.0, // 交叉轴方向（水平方向）的间距
            childAspectRatio: 1.0, // 子项的宽高比
          ),
          delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
              return Container(
                color: Colors.blue,
                child: Center(
                  child: Text(
                    'Item #$index',
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              );
            },
            childCount: 10, // 子项的数量
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: const Text(
              'This is a SliverToBoxAdapter. You can use it to add a regular widget in a sliver context.',
              style: TextStyle(fontSize: 18.0),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return _itemValue(Colors.red[300], 200);
            },
            childCount: 1,
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return _itemValue(Colors.blue[300], 600);
            },
            childCount: 1,
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return _itemValue(Colors.green[300], 1300);
            },
            childCount: 1,
          ),
        ),
      ],
    );
  }

  SingleChildScrollView buildSingleChildScrollView() {
    return SingleChildScrollView(
      controller: logic.scrollController,
      child: Column(
        children: [
          _itemValue(Colors.red[300], 200),
          _itemValue(Colors.blue[300], 600),
          _itemValue(Colors.green[300], 1300),
        ],
      ),
    );
  }

  _itemValue(Color? color, double? height) {
    return Container(
      color: color ?? Colors.green[300],
      height: height ?? 100,
    );
  }
}
