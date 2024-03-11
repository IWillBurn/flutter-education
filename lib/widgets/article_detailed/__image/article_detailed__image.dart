import 'package:flutter/material.dart';

class ArticleDetailedImage extends StatelessWidget {
  final String? imageUrl;

  const ArticleDetailedImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl ?? "",
      height: 200,
      width: double.infinity,
      fit: BoxFit.cover,
      errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
        return Container(
          color: Colors.grey,
          height: 200,
          width: double.infinity,
          child: const Icon(Icons.error, color: Colors.white),
        );
      },
    );
  }
}