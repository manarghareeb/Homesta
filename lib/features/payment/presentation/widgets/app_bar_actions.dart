import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/theming/styles.dart';

class AppBarActions extends StatelessWidget {
  const AppBarActions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          minimumSize: Size(42.w, 24.h),
          maximumSize: Size(42.w, 24.h),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          backgroundColor: ColorManager.soLightGreyColor,
        ),
        child: Text(
          '10sn',
          style: TextStyles.font13BlackW500.copyWith(
            color: ColorManager.blackColor,
          ),
        ),
      ),
    );
  }
}