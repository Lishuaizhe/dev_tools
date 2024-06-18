import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TimeBar extends StatefulWidget {
  const TimeBar({
    super.key,
  });

  @override
  State<TimeBar> createState() => _TimeBarState();
}

class _TimeBarState extends State<TimeBar> {
  //系统时间
  // var _date = '';

  @override
  void initState() {
    super.initState();

    _getDate();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(left: 20.w, top: 20.h, bottom: 40.h),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "活动",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text("星期五,10月15,2024", style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }

  void _getDate() {
    // final DateTime now = DateTime.now();
    // final String formattedDate = DateFormat('EEEE, MMMM d, y').format(now);
    // setState(() {
    //   _date = formattedDate;
    // });
  }
}
