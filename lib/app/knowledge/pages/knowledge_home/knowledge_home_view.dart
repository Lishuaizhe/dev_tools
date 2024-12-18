import 'package:bruno/bruno.dart';
import 'package:dev_tools/app/about/convertor/animated_banner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'knowledge_home_logic.dart';
import 'knowledge_home_state.dart';

/// @description:
/// @author
/// @date: 2024-06-03 09:40:54
class KnowledgeHomePage extends StatelessWidget {
  final KnowledgeHomeLogic logic = Get.put(KnowledgeHomeLogic());
  final KnowledgeHomeState state = Get.find<KnowledgeHomeLogic>().state;

  KnowledgeHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            Image.asset(
              'assets/images/knowledge/knowledge_home_view.png',
              width: double.infinity,
            ),
            Positioned(
              top: 44.w,
              right: 0,
              left: 0,
              bottom: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _tioLoginView(),
                  searchText(),
                  Expanded(
                    child: MediaQuery.removePadding(
                      context: Get.context!,
                      removeTop: true,
                      removeBottom: true,
                      child: ListView.separated(
                        itemBuilder: (c, i) {
                          return msgItemListView(i);
                        },
                        itemCount: 10,
                        separatorBuilder: (BuildContext context, int index) {
                          return Divider(
                            height: 1,
                            color: Colors.grey[200],
                          );
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container msgItemListView(int i) {
    return Container(
      height: 70.w,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 13.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 52.w,
            height: 52.w,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(52.w),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(52),
              child: Image.network('https://picsum.photos/100$i/1000'),
            ),
            // child: ClipRRect(
            //   borderRadius: BorderRadius.circular(10),
            //   child: const FlutterLogo(),
            // ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                logic.generateRandomString(4),
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF333333),
                ),
              ),
              Text(
                'Hi msg',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFFADB2C0),
                ),
              ).marginOnly(top: 4.w),
            ],
          ).marginOnly(left: 10.w),
          const Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '昨天',
                style: TextStyle(
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFFADB2C0),
                ),
              ),
              Container(
                width: 15.w,
                height: 15.w,
                decoration: BoxDecoration(
                  color: const Color(0xFFF55871),
                  borderRadius: BorderRadius.circular(15.w),
                ),
                child: Center(
                    child: Text(
                  logic.generateRandomValue(2),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 8.sp,
                  ),
                )),
              ).marginOnly(top: 10.w),
            ],
          ),
        ],
      ),
    );
  }

/*  
  Widget _timoAi() {
    return Container(
      height: 22.w,
      width: 107.w,
      padding: EdgeInsets.symmetric(vertical: 1.w),
      decoration: BoxDecoration(
          color: const Color(0xFF2FA9FD),
          borderRadius: BorderRadius.all(Radius.circular(11.w))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/knowledge/kl_lion.png')
              .marginOnly(right: 2.w),
          Text(
            'TIMO AI助手',
            style: TextStyle(
              color: Colors.white,
              fontSize: 12.sp,
            ),
          ),
        ],
      ),
    );
  }
*/
  Container searchText() {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 13.w,
        vertical: 10.w,
      ),
      width: double.infinity,
      height: 37.h,
      child: BrnSearchText(
        outSideColor: Colors.transparent,
        innerColor: const Color(0xFFDFE3EF),
        borderRadius: BorderRadius.all(Radius.circular(22.w)),
        innerPadding: EdgeInsets.zero,
        prefixIcon: Padding(
          padding: EdgeInsets.only(left: 14.w),
          child: Center(
            child: BrunoTools.getAssetSizeImage(
              BrnAsset.iconSearch,
              16.w,
              16.w,
              color: const Color(0xFF8992A3),
            ),
          ),
        ),
        hintStyle: TextStyle(fontSize: 14.sp, color: const Color(0xFF8992A3)),
        textStyle: TextStyle(fontSize: 14.sp),
      ),
    );
  }

  Container _tioLoginView() {
    return Container(
      width: double.infinity,
      height: 30.w,
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Stack(
        children: [
          const Positioned(left: 0, top: 10, child: AnimatedBanner()),
          Center(
            child: Image.asset(
              'assets/images/knowledge/home_page_login.png',
              width: 120.w,
              height: 14.w,
            ),
          ),
          Positioned(
            right: 0,
            child: Image.asset(
              'assets/images/knowledge/kl_msg_more.png',
              width: 28.w,
              height: 28.w,
            ),
          ),
          Positioned(
            right: 40.w,
            child: Image.asset(
              'assets/images/knowledge/kl_msg_list.png',
              width: 28.w,
              height: 28.w,
            ),
          ),
        ],
      ),
    );
  }
}
/*

Widget _itemView({required GestureTapCallback? onTap, required String text}) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 100.w,
        height: 100.w,
        child: Card(
          color: Colors.white,
          child: Center(child: Text(text)),
        ),
      ),
    );
  }

// ignore: non_constant_identifier_names
  Widget _BTCValue() {
    return Obx(() => Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: state
                  .getIntegerPartDigits(state.stateValue.value)
                  .reversed
                  .map(
                (e) {
                  return AnimationCounter(
                    value: double.parse(e.toString()),
                    duration: const Duration(seconds: 1),
                  );
                },
              ).toList(),
            ),
            Container(
              width: 5.w,
              height: 5.w,
              margin: EdgeInsets.only(bottom: 10.w, right: 10.w),
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10.w)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: state
                  .getDecimalPartDigits(state.stateValue.value)
                  .reversed
                  .map(
                (e) {
                  return AnimationCounter(
                    value: double.parse(e.toString()),
                    duration: const Duration(seconds: 1),
                  );
                },
              ).toList(),
            ),
          ],
        ));
  }

// return SafeArea(
    //   child: Obx(() => Column(
    //         children: [
    //           Text(logic.state.stateDateTime.value),
    //           _BTCValue(),
    //           SizedBox(
    //             width: double.infinity,
    //             height: 250.h,
    //             child: CustomPaint(
    //               painter:
    //                   LineChartPainterNew(dateList: state.chartDate['prices']),
    //             ),
    //           ).paddingSymmetric(horizontal: 15.w, vertical: 20.w),
    //           ElevatedButton(
    //             onPressed: () {
    //               logic.initDate();
    //               logic.getChart();
    //             },
    //             child: const Text('请求新的数据', maxLines: 10),
    //           ),
    //           Text('${state.chartDate['prices'][0]}'),
    //         ],
    //       )),
    // );

GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 5,
          mainAxisExtent: 100,
          crossAxisSpacing: 5,
          childAspectRatio: 0.75, // 每个子项的纵横比
        ),
        itemBuilder: (c, i) {
          var list = logic.getList()[i];
          return Container(
            width: double.infinity,
            color: Colors.greenAccent,
            child: Center(child: Text('$list')),
          );
        },
        itemCount: logic.getList().length,
      )
    */
