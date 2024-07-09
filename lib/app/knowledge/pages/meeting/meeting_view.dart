import 'package:dev_tools/app/knowledge/pages/meeting/meeting_state.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'meeting_logic.dart';

class MeetingPage extends StatelessWidget {
  final MeetingLogic controller = Get.put(MeetingLogic());
  final MeetingState state = Get.find<MeetingLogic>().state;

  MeetingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('V-Meeting'),
      ),
      body: ListView(
        children: [
          _meetingItem(),
        ],
      ),
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }

  BottomAppBar _bottomNavigationBar() {
    return BottomAppBar(
      color: Colors.transparent,
      height: 150.w,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: controller.joinMeeting,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: EdgeInsets.symmetric(horizontal: 80.w, vertical: 16.w),
              ),
              child: Text(
                '加入会议',
                style: TextStyle(fontSize: 18.sp),
              ),
            ),
            SizedBox(height: 16.w),
            Text.rich(
              TextSpan(
                text: '您可以 ',
                children: [
                  TextSpan(
                    text: '复制会议邀请',
                    style: const TextStyle(color: Colors.blue),
                    recognizer: TapGestureRecognizer()
                      ..onTap = controller.copyInvite,
                  ),
                  const TextSpan(text: '，发送至会议成员'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _meetingItem() {
    return Container(
      height: 235.w,
      padding: EdgeInsets.all(16.w),
      margin: EdgeInsets.symmetric(vertical: 8.w, horizontal: 16.w),
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage('assets/images/v_meeting_logo.png'),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(8.w),
      ),
      child: Column(
        children: [
          const SizedBox(height: 8.0),
          Text(
            '齐亚静的快速会议',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '888 888 426',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 8.sp),
              Icon(Icons.copy, size: 18.sp),
            ],
          ),
          SizedBox(height: 16.sp),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    '19:09',
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text('2023年11月01日'),
                ],
              ),
              Column(
                children: [
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.w),
                    color: Colors.grey[200],
                    child: const Text('1小时'),
                  ),
                  const Text('(GMT+08:00)'),
                ],
              ),
              Column(
                children: [
                  Text(
                    '20:09',
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text('2023年11月01日'),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
