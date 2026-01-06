import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/theming/styles.dart';
import 'package:image_picker/image_picker.dart';

class UploadImageWidget extends StatefulWidget {
  const UploadImageWidget({super.key});

  @override
  State<UploadImageWidget> createState() => _UploadImageWidgetState();
}

class _UploadImageWidgetState extends State<UploadImageWidget> {
  File? selectedImage;
  Future<void> pickImage() async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      setState(() {
        selectedImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: pickImage,
      child: Container(
        height: 150.h,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          border: Border.all(color: ColorManager.lightGreyColor),
        ),
        child:
            selectedImage == null
                ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.image_outlined,
                      color: ColorManager.greyColor,
                      size: 40,
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Upload Image',
                      style: TextStyles.font14deepGreyColorW400,
                    ),
                  ],
                )
                : ClipRRect(
                  borderRadius: BorderRadius.circular(12.r),
                  child: Image.file(
                    selectedImage!,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
      ),
    );
  }
}
