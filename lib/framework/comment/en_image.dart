import 'package:flutter/material.dart';

class EnImage extends StatelessWidget {
  final String imageUrl;
  final String? localImagePath;
  final double? width;
  final double? height;
  final BoxFit fit;

  const EnImage.network({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
  }) : localImagePath = null;

  const EnImage.local({
    super.key,
    required this.localImagePath,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
  }) : imageUrl = '';

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10), // 设置圆角
      child: localImagePath != null
          ? Image.asset(
              localImagePath!,
              width: width,
              height: height,
              fit: fit,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: width,
                  height: height,
                  color: Colors.grey[300],
                  child: const Icon(
                    Icons.error,
                    color: Color.fromARGB(255, 53, 52, 52),
                  ),
                );
              },
            )
          : Image.network(
              imageUrl,
              width: width,
              height: height,
              fit: fit,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: width,
                  height: height,
                  color: Colors.grey[300],
                  child: const Icon(
                    Icons.error,
                    color: Colors.red,
                  ),
                );
              },
            ),
    );
  }
}
