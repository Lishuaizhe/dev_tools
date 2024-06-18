import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../config/hero_comment_value.dart';
import 'information_add_logic.dart';
import 'information_add_state.dart';

/// @description:
/// @author
/// @date: 2024-06-03 13:18:26
class InformationAddPage extends StatelessWidget {
  final InformationAddLogic logic = Get.put(InformationAddLogic());
  final InformationAddState state = Get.find<InformationAddLogic>().state;

  InformationAddPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Create Post', style: TextStyle(fontSize: 20.sp)),
          actions: [
            Hero(
              tag: HeroTags.informationToSend,
              child: IconButton(
                onPressed: () {},
                icon: Obx(() => Icon(
                      Icons.send,
                      color:
                          state.myMind.isNotEmpty ? Colors.green : Colors.black,
                      size: 24.sp,
                    )),
              ),
            ).marginOnly(right: 3.w),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _userInfo(),
            BrnInputText(
              hint: "What's on your mind?",
              bgColor: Colors.transparent,
              textInputAction: TextInputAction.newline,
              maxLength: 500,
              autoFocus: false,
              focusNode: logic.focusNode,
              onTextChange: (v) {
                state.myMind.value = v;
              },
            ),
            Hero(
              tag: HeroTags.informationToSelectImage,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.w),
                  color: Colors.greenAccent[200],
                ),
                width: 100.w,
                height: 100.h,
                child: Icon(Icons.add, color: Colors.white, size: 30.sp),
              ),
            ),
          ],
        ).marginSymmetric(horizontal: 16.w),
      ),
    );
  }

  Widget _userInfo() {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(50.w),
          child: Image.network(
            'https://picsum.photos/100',
            width: 50.w,
            height: 50.w,
            fit: BoxFit.cover,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Zachary Li',
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                )),
            Text('Flutter Developer',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.grey,
                )).marginOnly(left: 1.w),
          ],
        ).marginOnly(left: 10.w),
      ],
    ).marginOnly(bottom: 20.h, top: 10.w);
  }
}
