import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

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
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: _appBar(),
        body: TabBarView(
          controller: logic.pageController,
          children: [
            _widgetItem(widget: _textWidgetItem()),
            _widgetItem(widget: _imageWidgetItem()),
            _widgetItem(
              widget: Column(
                children: [
                  _textWidgetItem(),
                  _imageWidgetItem(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  BrnAppBar _appBar() {
    return BrnAppBar(
      //自定义title
      title: Container(
        height: 44,
        padding: const EdgeInsets.only(left: 24, right: 12),
        child: ListView.separated(
          itemCount: 3,
          //横滑
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                // setState(() {
                //   this.currentIndex = index;
                // });
              },
              child: Center(
                child: Text(
                  index == 2 ? '标题' : '标题多文字',
                  // style: index == currentIndex
                  //     ? selectedHeiStyle
                  //     : unSelectedHeiStyle,
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(width: 24);
          },
        ),
      ),
    );
    // return AppBar(
    //   backgroundColor: Colors.white,
    //   leading: IconButton(
    //     padding: EdgeInsets.zero,
    //     icon: const Icon(Icons.search_rounded),
    //     onPressed: () {},
    //   ),
    //   flexibleSpace: TabBar(
    //     controller: logic.pageController,
    //     tabs: [
    //       Container(
    //         alignment: Alignment.topCenter,
    //         child:  Tab(text: 'exafarads'),
    //       ),
    //       Container(
    //         alignment: Alignment.bottomCenter,
    //         child: Tab(text: 'afadsfafads'),
    //       ),
    //       Container(
    //         alignment: Alignment.bottomCenter,
    //         child: Tab(text: 'afadsfafads'),
    //       ),
    //     ],
    //     isScrollable: true,
    //     indicator: EnUnderlineTabIndicator(
    //       borderSide: BorderSide(width: 5.w, color: Colors.black),
    //       borderRadius: BorderRadius.circular(4.w),
    //       insets: EdgeInsets.only(bottom: 2.w),
    //     ),
    //     labelStyle: TextStyle(
    //       color: Colors.black,
    //       fontSize: 18.sp,
    //       fontWeight: FontWeight.w600,
    //     ),
    //     unselectedLabelStyle: TextStyle(
    //       color: Colors.black,
    //       fontSize: 14.sp,
    //       fontWeight: FontWeight.w400,
    //     ),
    //     dividerColor: Colors.transparent,
    //     tabAlignment: TabAlignment.start,
    //   ).marginSymmetric(horizontal: 40.w),
    // );
  }

  // IconButton(
  //     onPressed: () {},
  //     icon: const Icon(Icons.notifications_none_rounded)),
  // IconButton(onPressed: () {}, icon: const Icon(Icons.search_rounded)),
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

// Widget _appBar() {
//   return Row(
//     crossAxisAlignment: CrossAxisAlignment.end,
//     mainAxisAlignment: MainAxisAlignment.center,
//     children: [
//       _itemView(title: '广场', select: 0),
//       _itemView(title: '关注', select: 1).marginSymmetric(horizontal: 20.w),
//       _itemView(title: 'V友圈', select: 2),
//     ],
//   ).marginSymmetric(horizontal: 50.w);
// }
//
// Widget _itemView({
//   required String title,
//   required int select,
// }) {
//   return Obx(() {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.end,
//       children: [
//         Text(
//           title,
//           style: state.pageIndex.value == select
//               ? TextStyle(
//                   color: Colors.black,
//                   fontWeight: FontWeight.w600,
//                   fontSize: 18.sp,
//                 )
//               : TextStyle(
//                   color: const Color(0xFF4F5563),
//                   fontWeight: FontWeight.w400,
//                   fontSize: 15.sp,
//                 ),
//         ),
//         Visibility(
//           visible: state.pageIndex.value == select,
//           child: Container(
//             width: 20.w,
//             height: 4.w,
//             decoration: BoxDecoration(
//                 color: Colors.black,
//                 borderRadius: BorderRadius.all(Radius.circular(2.w))),
//           ).marginOnly(top: 4.w),
//         ),
//       ],
//     );
//   });
// }
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
