import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/theming/styles.dart';

class ReviewsAndViewAllSection extends StatelessWidget {
  const ReviewsAndViewAllSection({
    super.key,
    required this.isVisible,
    required this.onTap
  });
 final bool isVisible;
 final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
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
              isVisible ? Icons.keyboard_arrow_up_outlined :  Icons.keyboard_arrow_down_outlined,
                size: 29.sp,
                color: ColorManager.greyColor,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
