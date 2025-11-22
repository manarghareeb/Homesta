import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/core/theming/colors.dart';

class PhotoProfile extends StatelessWidget {
  const PhotoProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 80.r,
          backgroundColor: ColorManager.buttonColor,
        ),
        Positioned(
          bottom: 0,
          right: 8,
          child: GestureDetector(
            onTap: () {},
            child: Container(
              width: 40.w,
              height: 40.h,
              decoration: BoxDecoration(
                color: ColorManager.mainColor,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.camera_alt_outlined,
                color: ColorManager.greyColor,
                size: 22.sp,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

