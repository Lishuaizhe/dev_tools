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
    return const SafeArea(
      top: false,
      child: Stack(
        children: [
          // NestedScrollView(
          //   controller: logic.scrollController,
          //   headerSliverBuilder: (c, i) {
          //     return [
          //       SliverAppBar(
          //         collapsedHeight: 45,
          //         toolbarHeight: 0,
          //         titleSpacing: 0,
          //         leadingWidth: 0,
          //         elevation: 0,
          //         pinned: true,
          //         floating: true,
          //         leading: Container(),
          //         backgroundColor: Colors.yellowAccent,
          //         expandedHeight: 500,
          //         title: Text('data'),
          //       ),
          //     ];
          //   },
          // body: TabBarView(
          //   controller: logic.tabController,
          //   children: [
          //     Text('data'),
          //     Text('data'),
          //   ],
          // ),
          // ),
        ],
      ),
    );
    /* 
    return Container(
      color: Colors.greenAccent,
      child: SafeArea(
        child: SingleChildScrollView(
          controller: logic.scrollController,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.search,
                        color: Colors.white,
                        size: 28.sp,
                      )),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.more_horiz_outlined,
                      color: Colors.white,
                      size: 28.sp,
                    ),
                  ),
                ],
              ),
              heardAbout(),
            ],
          ),
        ),
      ),
    );
   */
  }

  Widget heardAbout() {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _imageWithEdit(),
            _nameAndIDAndMsg(),
          ],
        ),
        _followingAndFollower(),
        _gridViewUser(),
        _pointsCommunity(),
      ],
    );
  }

  Widget _followingAndFollower() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('310',
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
            )).marginOnly(right: 5.w),
        Text('关注',
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            )),
        Container(
          color: Colors.white,
          height: 9.w,
          width: 1.w,
          margin: EdgeInsets.symmetric(horizontal: 5.w),
        ),
        Text('10',
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
            )).marginOnly(right: 5.w),
        Text('粉丝',
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            )),
        const Spacer(),
        const Icon(Icons.edit_note)
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
        Text('@zachary_li',
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
            width: 80.w, // 设置图片宽度
            height: 80.w, // 设置图片高度
            fit: BoxFit.cover, // 设置图片填充方式
          ),
        ).marginOnly(bottom: 10.h),
      ],
    );
  }

  _gridViewUser() {
    return SizedBox(
      height: 80.w,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (c, i) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 40.w,
                height: 40.w,
                child: const Placeholder(),
              ),
              const Text('data'),
            ],
          );
        },
        itemCount: 10,
      ),
    );
  }

  _pointsCommunity() {
    return Row(
      children: [
        Expanded(
            child: Container(
          height: 50.w,
          color: Colors.grey,
          child: const Center(child: Text('data')),
        )),
        Expanded(
            child: Container(
          height: 50.w,
          color: Colors.grey,
          child: const Center(child: Text('data')),
        )),
      ],
    );
  }
}

/*AnimatedContainer(
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
        ),*/
