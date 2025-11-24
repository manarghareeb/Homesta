import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/theming/styles.dart';

class ReviewsAndViewAllSection extends StatelessWidget {
  const ReviewsAndViewAllSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Reviews',
          style: TextStyles.font18BlackW500.copyWith(
            color: ColorManager.brounColor,
          ),
        ),
        Row(
          children: [
            Text('View All', style: TextStyles.font16GreyRegular),
            SizedBox(width: 4.w),
            Icon(
              Icons.arrow_forward_ios,
              size: 12.sp,
              color: ColorManager.greyColor,
            ),
          ],
        ),
      ],
    );
  }
}
