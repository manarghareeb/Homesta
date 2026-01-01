import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:homesta/core/api/end_ponits.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  const CustomCachedNetworkImage({super.key, required this.imagePath});
final String imagePath;
  @override
  Widget build(BuildContext context) {
    return  CachedNetworkImage(
  imageUrl: EndPoint.baseUrl +imagePath,
  fit: BoxFit.cover,
  placeholder: (context, url) =>
      const Center(child: CircularProgressIndicator()),
  errorWidget: (context, url, error) =>
      const Icon(Icons.image_not_supported),
);
  }
}