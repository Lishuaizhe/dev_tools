import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'resource_meeting_logic.dart';
import 'resource_meeting_state.dart';

/// @description:
/// @author
/// @date: 2024-06-28 11:20:01
class ResourceMeetingPage extends StatelessWidget {
  final ResourceMeetingLogic logic = Get.put(ResourceMeetingLogic());
  final ResourceMeetingState state = Get.find<ResourceMeetingLogic>().state;

  ResourceMeetingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('资源查询'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          dateTiemItem(context),
          meetingTypeItem(),
          resourceMeeting(),
          TimeListItem(),
        ],
      ),
      bottomNavigationBar: _bottomNavigationBar()
          .marginOnly(bottom: 16.w, right: 20.w, left: 20.w),
    );
  }

  ElevatedButton _bottomNavigationBar() {
    return ElevatedButton(
      onPressed: logic.queryResources,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        padding: const EdgeInsets.symmetric(horizontal: 80.0, vertical: 16.0),
      ),
      child: const Text(
        '查询',
        style: TextStyle(fontSize: 18.0),
      ),
    );
  }

  Expanded TimeListItem() {
    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2,
        ),
        itemCount: logic.timeSlots.length,
        itemBuilder: (context, index) {
          return Card(
            color: Colors.white,
            margin: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: const Icon(Icons.group),
              title: Text(logic.timeSlots[index]),
              subtitle: const Text('可预约'),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () {
                // Handle time slot selection
              },
            ),
          );
        },
      ),
    );
  }

  Widget resourceMeeting() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        children: [
          const Expanded(
            child: Text('会议资源', style: TextStyle(fontSize: 16.0)),
          ),
          const SizedBox(width: 8.0),
          Expanded(
            flex: 2,
            child: Obx(() => DropdownButton<String>(
                  isExpanded: true,
                  value: logic.selectedMeetingRoom.value,
                  items: logic.meetingRooms
                      .map((room) => DropdownMenuItem<String>(
                            value: room,
                            child: Text(room),
                          ))
                      .toList(),
                  onChanged: (value) {
                    logic.selectedMeetingRoom.value = value!;
                  },
                )),
          ),
        ],
      ),
    );
  }

  Widget meetingTypeItem() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        children: [
          const Expanded(
            child: Text('会议类型', style: TextStyle(fontSize: 16.0)),
          ),
          const SizedBox(width: 8.0),
          Expanded(
            flex: 2,
            child: Obx(() => DropdownButton<String>(
                  isExpanded: true,
                  value: logic.selectedMeetingType.value,
                  items: logic.meetingTypes
                      .map((type) => DropdownMenuItem<String>(
                            value: type,
                            child: Text(type),
                          ))
                      .toList(),
                  onChanged: (value) {
                    logic.selectedMeetingType.value = value!;
                  },
                )),
          ),
        ],
      ),
    );
  }

  Widget dateTiemItem(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        children: [
          const Expanded(
            child: Text('日期', style: TextStyle(fontSize: 16.0)),
          ),
          const SizedBox(width: 8.0),
          Expanded(
            flex: 2,
            child: GestureDetector(
              onTap: () => logic.selectDate(context),
              child: Obx(() => Text(
                    logic.selectedDate.value,
                    style: const TextStyle(fontSize: 16.0),
                  )),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.calendar_today),
            onPressed: () => logic.selectDate(context),
          ),
        ],
      ),
    ).marginOnly(bottom: 16.w);
  }
}
