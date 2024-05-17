import 'package:bruno/bruno.dart';
import 'package:get/get.dart';

class HomeState {
  HomeState() {
    ///Initialize variables
  }

  final tagIndex = 0.obs;

  // 显示用的数据
  final List<BrnBottomTabBarItem> tabItems = <BrnBottomTabBarItem>[].obs;
}
