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
          backgroundImage: const AssetImage('assets/images/image 1.png'),
          radius: 60.r,
          backgroundColor: ColorManager.brounColor,
        ),
        Positioned(
          bottom: 0,
          right: 5,
          child: GestureDetector(
            onTap: () {},
            child: Container(
              width: 35.w,
              height: 35.h,
              decoration: BoxDecoration(
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

