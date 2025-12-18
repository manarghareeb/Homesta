import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/theming/styles.dart';

class ProductTitleAndRatingSection extends StatelessWidget {
  final String name;
  final double rating;

  const ProductTitleAndRatingSection({
    super.key,
    required this.name,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(name, style: TextStyles.font16BlackRegular),
        Row(
          children: [
            Icon(Icons.star, color: ColorManager.yellowColor, size: 14.sp),
            SizedBox(width: 2.w),
            Text(rating.toStringAsFixed(1), style: TextStyles.font14BlackColorW400),
          ],
        )
      ],
    );
  }
}