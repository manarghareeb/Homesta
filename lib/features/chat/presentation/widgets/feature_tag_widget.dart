import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/theming/styles.dart';

class FeatureTagWidget extends StatelessWidget {
  const FeatureTagWidget({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.5),
        borderRadius: BorderRadius.circular(25.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 24.w,
            height: 24.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white),
            ),
            child: Icon(
              Icons.check,
              color: ColorManager.primaryColor,
              size: 16.sp,
            ),
          ),
          SizedBox(width: 4.w),
          Text(title, style: TextStyles.font12PiramyColorW400),
        ],
      ),
    );
  }
}
