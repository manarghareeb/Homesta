import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:homesta/core/theming/colors.dart';

class PhotoProfile extends StatefulWidget {
  const PhotoProfile({
    super.key,
    required this.onImageSelected,
    this.initialImageUrl,
    this.placeholderAsset = 'assets/images/image 1.png',
  });

  final void Function(XFile image) onImageSelected;
  final String? initialImageUrl; // optional: show server image if available
  final String placeholderAsset;

  @override
  State<PhotoProfile> createState() => _PhotoProfileState();
}

class _PhotoProfileState extends State<PhotoProfile> {
  XFile? _pickedImage;

  Future<void> _pickImage() async {
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() => _pickedImage = picked);
      widget.onImageSelected(picked);
    }
  }

  ImageProvider _resolveImageProvider() {
    if (_pickedImage != null) {
      return FileImage(File(_pickedImage!.path));
    }
    if (widget.initialImageUrl != null && widget.initialImageUrl!.isNotEmpty) {
      return NetworkImage(widget.initialImageUrl!);
    }
    return AssetImage(widget.placeholderAsset);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          backgroundImage: _resolveImageProvider(),
          radius: 60.r,
        ),
        Positioned(
          bottom: 0,
          right: 5,
          child: GestureDetector(
            onTap: _pickImage,
            child: Container(
              width: 35.w,
              height: 35.h,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.camera_alt_outlined,
                color: ColorManager.primaryColor,
                size: 20.sp,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
