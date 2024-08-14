import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'resource_meeting_state.dart';

/// @description:
/// @author
/// @date: 2024-06-28 11:20:01
class ResourceMeetingLogic extends GetxController {
  final state = ResourceMeetingState();
  var selectedDate = ''.obs;
  var selectedMeetingType = '普通会议(适用于10人以下)'.obs;
  var selectedMeetingRoom = '云会议室2231'.obs;

  List<String> meetingTypes = [
    '普通会议(适用于10人以下)',
    '大型会议(适用于10人以上)',
  ];

  List<String> meetingRooms = [
    '云会议室2231',
    '云会议室2232',
    '云会议室2233',
  ];

  List<String> timeSlots = [
    '08:00～09:30',
    '10:00～11:30',
    '12:00～13:30',
    '14:00～15:30',
    '16:00～17:30',
    '18:00～19:30',
  ];

  @override
  void onInit() {
    super.onInit();
    selectedDate.value = DateFormat('yyyy/MM/dd EEEE').format(DateTime.now());
  }

  void selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != DateTime.now()) {
      selectedDate.value = DateFormat('yyyy/MM/dd EEEE').format(picked);
    }
  }

  void queryResources() {
    // Handle resource query logic here
    print('Querying resources...');
  }
}
