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
            color: ColorManager.thirdColor,
          ),
        ),
        Row(
          children: [
            Text('View All', style: TextStyles.font16GreyRegular),
            SizedBox(width: 4.w),
            Icon(
              Icons.arrow_downward_sharp,
              size: 20.sp,
              color: ColorManager.greyColor,
            ),
          ],
        ),
      ],
    );
  }
}
