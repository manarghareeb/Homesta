import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/theming/styles.dart';

class ProgressItem extends StatelessWidget {
  const ProgressItem({
    super.key,
    required this.label,
    required this.value,
    required this.percentText,
  });

  final String label;       
  final double value;  
  final String percentText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyles.font14soLightGreyColorW400,
        ),
        SizedBox(height: 3.h),
        Row(
          children: [
            SizedBox(
              width: 50.w,
              child: LinearProgressIndicator(
                value: value,
                color: ColorManager.primaryColor,
                backgroundColor: ColorManager.soLightGreyColor,
                minHeight: 5.h,
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
            SizedBox(width: 8.w),
            Text(
              percentText,
              style: TextStyles.font14soLightGreyColorW400.copyWith(
                fontSize: 13.sp,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
