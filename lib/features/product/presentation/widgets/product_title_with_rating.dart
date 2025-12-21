import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/theming/styles.dart';

class ProductTitleWithRating extends StatelessWidget {
  const ProductTitleWithRating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Modern Chair', style: TextStyles.font16BlackRegular),
        Row(
          children: [
            Icon(
              Icons.star,
              color: ColorManager.yellowColor,
              size: 20.sp,
            ),
            SizedBox(width: 3.w),
            Text('4.9', style: TextStyles.font14BlackColorW400),
          ],
        ),
      ],
    );
  }
}