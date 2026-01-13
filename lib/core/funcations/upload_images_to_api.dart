import 'dart:io';

import 'package:dio/dio.dart';
Future<List<MultipartFile>> uploadImageToApi(List<File> images) async {
  return images.map((image) {
    return MultipartFile.fromFileSync(
      image.path,
      filename: image.path.split('/').last,
    );
  }).toList();
}
