import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:homesta/core/api/end_ponits.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  const CustomCachedNetworkImage({
    super.key,
    required this.imagePath,
    this.width,
    this.height,
    this.fit,
  });
  final String imagePath;
  final double? width;
  final double? height;
  final BoxFit? fit;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      width: width,
      height: height,

      imageUrl: EndPoint.baseUrl + imagePath,
      fit: fit ?? BoxFit.cover,
      placeholder:
          (context, url) => const Center(child: CircularProgressIndicator()),
      errorWidget:
          (context, url, error) => const Icon(Icons.image_not_supported),
    );
  }
}
