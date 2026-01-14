import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/theming/styles.dart';

class ProductTitleWithRating extends StatelessWidget {
  const ProductTitleWithRating({super.key, required this.title, required this.rating});
final String title;
final String rating;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: TextStyles.font16BlackRegular),
        Row(
          children: [
            Icon(Icons.star, color: ColorManager.yellowColor, size: 20.sp),
            SizedBox(width: 3.w),
            Text(rating, style: TextStyles.font14BlackColorW400),
          ],
        ),
      ],
    );
  }
}
