import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/features/product/domain/entities/product_entitty.dart';

import 'package:image_picker/image_picker.dart';

class ImageUpload extends StatefulWidget {
  const ImageUpload({
    super.key,
    required this.isEdit,
    this.product,
    this.onImagesSelected, // callback للـ parent
  });
  final bool isEdit;
  final ProductEntity? product;
  final ValueChanged<List<File>>? onImagesSelected;

  @override
  State<ImageUpload> createState() => _ImageUploadState();
}

class _ImageUploadState extends State<ImageUpload> {
  final ImagePicker picker = ImagePicker();
  List<File> selectedImages = [];

Future<void> pickImages() async {
  final List<XFile>? pickedFiles = await picker.pickMultiImage();

  if (pickedFiles != null && pickedFiles.isNotEmpty) {
    final files = pickedFiles.map((x) => File(x.path)).toList();

    setState(() {
      selectedImages = files; // كل الصور اللي اتختارت
    });

    widget.onImagesSelected?.call(selectedImages);
  }
}


  void removeImage(File image) {
    setState(() {
      selectedImages.remove(image);
    });
    widget.onImagesSelected?.call(selectedImages);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: pickImages,
      child: Container(
        height: 240.h,
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: selectedImages.isEmpty
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.cloud_upload_outlined),
                    SizedBox(height: 16.h),
                    Text('Click here to upload images'),
                  ],
                ),
              )
            : ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: selectedImages.length,
                itemBuilder: (context, index) {
                  final img = selectedImages[index];
                  return Stack(
                    children: [
                      Image.file(img, width: 150.w, fit: BoxFit.cover),
                      Positioned(
                        right: 0,
                        top: 0,
                        child: GestureDetector(
                          onTap: () => removeImage(img),
                          child: Icon(Icons.close, color: Colors.red),
                        ),
                      ),
                    ],
                  );
                },
              ),
      ),
    );
  }
}
