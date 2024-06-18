import 'package:dev_tools/router/app_router.dart';
import 'package:dev_tools/router/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../config/hero_comment_value.dart';
import 'information_home_logic.dart';
import 'information_home_state.dart';

/// @description:
/// @author
/// @date: 2024-06-03 09:40:06
class InformationHomePage extends StatelessWidget {
  final InformationHomeLogic logic = Get.put(InformationHomeLogic());
  final InformationHomeState state = Get.find<InformationHomeLogic>().state;

  InformationHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _appBar(),
        body: SingleChildScrollView(
            child: Column(children: [
          _widgetItem(widget: _textWidgetItem()),
          _widgetItem(widget: _imageWidgetItem()),
          _widgetItem(
              widget:
                  Column(children: [_textWidgetItem(), _imageWidgetItem()])),
        ])),
        floatingActionButton: _floatingActionButton());
  }

  GestureDetector _floatingActionButton() {
    return GestureDetector(
      onTap: () {
        AppRouter.push(Routes.informationAdd);
      },
      child: Hero(
        tag: HeroTags.informationToSelectImage,
        child: Container(
          width: 60.w,
          height: 60.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(35.w),
            color: Colors.green[500],
          ),
          child: Icon(Icons.add_rounded, color: Colors.white, size: 30.sp),
        ).marginOnly(bottom: 20.w),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      actions: [
        IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none_rounded)),
        IconButton(onPressed: () {}, icon: const Icon(Icons.search_rounded)),
      ],
    );
  }

  // msg
  Widget _textWidgetItem() {
    return Text(
      "Flutter is Google's UI toolkit for building natively compiled applications for mobile, web, and desktop from a single codebase.Flutter is Google's UI toolkit for building natively compiled applications for mobile, web, and desktop from a single codebase.Flutter is Google's UI toolkit for building natively compiled applications for mobile, web, and desktop from a single codebase.Flutter is Google's UI toolkit for building natively compiled applications for mobile, web, and desktop from a single codebase.",
      style: TextStyle(
        fontSize: 14.sp,
        color: Colors.black,
      ),
    );
  }

  Widget _widgetItem({Widget? widget}) {
    return Card(
      color: Colors.white,
      margin: EdgeInsets.only(top: 10.w, left: 10.w, right: 10.w),
      shadowColor: Colors.white,
      elevation: 0,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.w),
        width: double.infinity,
        child: Column(children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50.w),
                child: SizedBox(
                    width: 40.w,
                    height: 40.w,
                    child: Image.network(
                      'https://picsum.photos/100',
                      fit: BoxFit.cover,
                    )),
              ).marginOnly(right: 10.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Zachary Li',
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(),
                        Text('5h',
                            style:
                                TextStyle(fontSize: 14.sp, color: Colors.grey)),
                        Icon(Icons.more_vert_rounded,
                            size: 18.sp, color: Colors.grey)
                      ],
                    ),
                    if (widget != null) widget,
                  ],
                ),
              ),
            ],
          ),
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            Icon(Icons.comment_outlined, size: 16.sp).marginOnly(right: 2.w),
            Text('12', style: TextStyle(fontSize: 12.sp))
                .marginOnly(right: 10.w),
            Icon(Icons.favorite_border_outlined, size: 16.sp)
                .marginOnly(right: 2.w),
            Text('24', style: TextStyle(fontSize: 12.sp))
                .marginOnly(right: 10.w),
            Icon(Icons.bookmark_border_outlined, size: 16.sp)
                .marginOnly(right: 10.w),
            Icon(Icons.share_outlined, size: 16.sp),
          ]).marginOnly(top: 10.w)
        ]),
      ),
    );
  }

  Widget _imageWidgetItem() {
    return Row(
      children: [
        Container(
            constraints: BoxConstraints(
              maxWidth: 280.w,
              maxHeight: 280.w,
            ),
            child: Image.network(
              'https://picsum.photos/100',
              fit: BoxFit.cover,
            )),
      ],
    );
  }
}

// IconButton(
//     onPressed: () {
//       state.dashboardState.value = !state.dashboardState.value;
//     },
//     icon: Obx(() => Hero(
//           tag: HeroTags.informationToSend,
//           child: Icon(
//               state.dashboardState.value
//                   ? Icons.space_dashboard
//                   : Icons.dashboard,
//               size: 26.sp),
//         ))),
// Expanded(
//   child: GestureDetector(
//     onTap: () {
//       AppRouter.push(Routes.informationSearch);
//     },
//     child: Container(
//       height: 44.h,
//       margin: EdgeInsets.symmetric(horizontal: 10.w),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(10.w),
//         color: Colors.grey[200],
//       ),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Hero(
//             tag: HeroTags.informationToSend,
//             child: Icon(
//               Icons.search,
//               color: Colors.grey,
//               size: 20.sp,
//             ),
//           ),
//           Text(
//             'Search',
//             style: TextStyle(
//               color: Colors.grey,
//               fontSize: 14.sp,
//             ),
//           ),
//         ],
//       ),
//     ),
//   ),
// ),
