import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'logic.dart';

class Game2048Page extends StatelessWidget {
  Game2048Page({super.key});

  final logic = Get.find<Game2048Logic>();
  final state = Get
      .find<Game2048Logic>()
      .state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('2048 Game'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: logic.reset,
          ),
        ],
      ),
      body: GestureDetector(
        onHorizontalDragEnd: (details) {
          if (details.velocity.pixelsPerSecond.dx > 0) {
            logic.move('right');
          } else {
            logic.move('left');
          }
        },
        onVerticalDragEnd: (details) {
          if (details.velocity.pixelsPerSecond.dy > 0) {
            logic.move('down');
          } else {
            logic.move('up');
          }
        },
        child: GetBuilder<Game2048Logic>(
          builder: (controller) {
            return Obx(() {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Score: ${controller.score}',
                      style: TextStyle(fontSize: 24.sp)),
                  const SizedBox(height: 20),
                  GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 16,
                    gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                    ),
                    itemBuilder: (context, index) {
                      int row = index ~/ 4;
                      int col = index % 4;
                      return Container(
                        margin: EdgeInsets.all(4.w),
                        decoration: BoxDecoration(
                          color: _getTileColor(controller.board[row][col]),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Container(
                          color: Colors.amber[100],
                          child: Center(
                            child: Text(
                              controller.board[row][col] == 0
                                  ? ''
                                  : '${controller.board[row][col]}',
                              style: const TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  if (controller.isGameOver)
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Game Over',
                        style: TextStyle(fontSize: 24, color: Colors.red),
                      ),
                    ),
                ],
              );
            });
          },
        ),
      ),
    );
  }

  Color _getTileColor(int value) {
    switch (value) {
      case 2:
        return Colors.blue[50]!;
      case 4:
        return Colors.blue[100]!;
      case 8:
        return Colors.blue[200]!;
      case 16:
        return Colors.blue[300]!;
      case 32:
        return Colors.blue[400]!;
      case 64:
        return Colors.blue[500]!;
      case 128:
        return Colors.blue[600]!;
      case 256:
        return Colors.blue[700]!;
      case 512:
        return Colors.blue[800]!;
      case 1024:
        return Colors.blue[900]!;
      case 2048:
        return Colors.orange;
      default:
        return Colors.grey[200]!;
    }
  }
}
