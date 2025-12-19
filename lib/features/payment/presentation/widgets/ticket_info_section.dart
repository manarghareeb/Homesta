import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/theming/styles.dart';

class TicketInfoSection extends StatelessWidget {
  const TicketInfoSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 12.w,
            vertical: 6.h,
          ),
          decoration: BoxDecoration(
            color: ColorManager.soLightGreyColor,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Text(
            'Adult / A. Category / C Block',
            style: TextStyles.font13BlackW500.copyWith(
              color: ColorManager.blackColor,
            ),
          ),
        ),
        SizedBox(width: 8.w),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 10.w,
            vertical: 6.h,
          ),
          decoration: BoxDecoration(
            color: ColorManager.soLightGreyColor,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Text(
            'x1',
            style: TextStyles.font13BlackW500.copyWith(
              color: ColorManager.blackColor,
            ),
          ),
        ),
      ],
    );
  }
}