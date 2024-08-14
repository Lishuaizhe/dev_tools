import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'about_home_logic.dart';
import 'about_home_state.dart';

/// @description:
/// @author
/// @date: 2024-06-03 09:43:00
class AboutHomePage extends StatelessWidget {
  final AboutHomeLogic logic = Get.put(AboutHomeLogic());
  final AboutHomeState state = Get.find<AboutHomeLogic>().state;

  AboutHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(top: false, child: bodyWeight());
  }

  Widget bodyWeight() {
    return Stack(
      children: [
        Stack(
          children: [
            AnimatedContainer(
              height: 301.w,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFFF5F2F7), // 开始颜色
                    Color(0xFFD8E2F5), // 中间颜色
                    Color(0xFFE2FEF3), // 结束颜色
                  ],
                  stops: [0.0, 0.5, 1.0], // 颜色停靠点，与中心颜色对应
                ),
                // 这里设置所有角的半径为0
                borderRadius: BorderRadius.zero,
              ),
              duration: const Duration(microseconds: 1),
            ),
            Positioned(
              top: 44.w,
              right: 0,
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.search,
                        color: Colors.white,
                        size: 30.sp,
                      )),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.more_vert_outlined,
                      color: Colors.white,
                      size: 30.sp,
                    ),
                  ).marginOnly(right: 5.w),
                ],
              ),
            ),
          ],
        ),
        SingleChildScrollView(
          controller: logic.scrollController,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [heardAbout(), SizedBox(height: 2000.w)],
          ),
        ),
      ],
    );
  }

  Widget heardAbout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _imageWithEdit(),
        _nameAndIDAndMsg(),
        _followingAndFollower(),
      ],
    ).paddingOnly(left: 20.w, right: 20.w, top: 120.h, bottom: 20.h);
  }

  Widget _followingAndFollower() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('310',
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold))
            .marginOnly(right: 5.w),
        Text('Following',
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            )),
        Text('10',
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold))
            .marginOnly(left: 20.w, right: 5.w),
        Text('Followers',
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            )),
      ],
    ).marginOnly(top: 5.w);
  }

  Widget _nameAndIDAndMsg() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Zachary Li',
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
            )).marginOnly(bottom: 5.w),
        Text('@zacharyli',
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.grey,
            )).marginOnly(bottom: 5),
        Text('It is our doty !',
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.grey,
            )).marginOnly(bottom: 5),
      ],
    );
  }

  Widget _imageWithEdit() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(50.w), // 设置圆角半径
          child: Image.network(
            'https://picsum.photos/100',
            width: 70.w, // 设置图片宽度
            height: 70.w, // 设置图片高度
            fit: BoxFit.cover, // 设置图片填充方式
          ),
        ).marginOnly(bottom: 10.h),
        SizedBox(
                height: 30,
                child: OutlinedButton(
                    onPressed: () {}, child: const Text('Edit Profile')))
            .marginOnly(bottom: 10)
      ],
    );
  }
}
