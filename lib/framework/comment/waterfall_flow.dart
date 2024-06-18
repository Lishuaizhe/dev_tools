import 'package:dev_tools/framework/comment/en_image.dart';
import 'package:dev_tools/router/app_router.dart';
import 'package:dev_tools/router/routes.dart';
import 'package:flutter/material.dart';

class WaterfallFlow extends StatelessWidget {
  final List<String> images = [
    'https://picsum.photos/600',
    'https://picsum.photos/601',
    'https://picsum.photos/602',
    'https://picsum.photos/603',
  ];

  WaterfallFlow({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.all(8.0),
          sliver: SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // 每行两列
              mainAxisSpacing: 8.0,
              crossAxisSpacing: 8.0,
              childAspectRatio: 0.75, // 每个子项的纵横比
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      AppRouter.push(Routes.informationDetails);
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: EnImage.network(
                        imageUrl: images[index % images.length],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              },
              childCount: 20, // 子项数量
            ),
          ),
        ),
      ],
    );
  }
}
