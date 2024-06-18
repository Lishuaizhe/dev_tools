import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'information_search_logic.dart';
import 'information_search_state.dart';

/// @description:
/// @author
/// @date: 2024-06-03 14:10:01
class InformationSearchPage extends StatelessWidget {
  final InformationSearchLogic logic = Get.put(InformationSearchLogic());
  final InformationSearchState state = Get.find<InformationSearchLogic>().state;

  InformationSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Expanded(
            child: Container(
              height: 44.h,
              margin: EdgeInsets.symmetric(horizontal: 10.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.w),
                color: Colors.grey[200],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.search,
                    color: Colors.grey,
                    size: 20.sp,
                  ),
                  Text(
                    '输入您想搜索的内容',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14.sp,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
