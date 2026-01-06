import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/theming/styles.dart';
import 'package:homesta/features/seller/product/data/models/product_seller_model.dart';
import 'package:image_picker/image_picker.dart';

class ImageUpload extends StatefulWidget {
  const ImageUpload({
    super.key,
    required this.isEdit,
    this.product,
    this.onImagePicked,
  });
  final bool isEdit;
  final Product? product;
  final ValueChanged<File>? onImagePicked;

  @override
  State<ImageUpload> createState() => _ImageUploadState();
}

class _ImageUploadState extends State<ImageUpload> {
  File? image;
  final ImagePicker picker = ImagePicker();

  Future<void> pickImage() async {
    final XFile? pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      setState(() {
        image = File(pickedFile.path);
      });
      if (widget.onImagePicked != null) {
        widget.onImagePicked!(image!);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: pickImage,
      child: Container(
        height: 240.h,
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: ColorManager.lightGreyIconColor),
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15.r),

          child:
              image != null
                  ? Image.file(image!, fit: BoxFit.cover)
                  : (widget.isEdit && widget.product != null
                      ? Image.asset(widget.product!.image, fit: BoxFit.cover)
                      : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.cloud_upload_outlined,
                            color: ColorManager.blackColor,
                          ),
                          SizedBox(height: 16.h),
                          Text(
                            'Click here to upload images',
                            style: TextStyles.font20BlackColorW500,
                          ),
                        ],
                      )),
        ),
      ),
    );
  }
}
