import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/theming/styles.dart';

class ProductImageWithBadgeSection extends StatelessWidget {
  final String image;
  final int discountPercent;

  const ProductImageWithBadgeSection({
    super.key,
    required this.image,
    required this.discountPercent,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.vertical(top: Radius.circular(10.r)),
          child: Image.asset(
            image,
            width: double.infinity,
            height: 135.h,
            fit: BoxFit.cover,
          ),
        ),
        if (discountPercent > 0)
          Positioned(
            top: 8.h,
            left: 8.w,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 5.h),
              decoration: BoxDecoration(
                color: ColorManager.primaryColor,
                borderRadius: BorderRadius.circular(15.r),
              ),
              child: Text(
                '$discountPercent% Off',
                style: TextStyles.font12GreyColorW400
                    .copyWith(color: ColorManager.soLightGreyColor),
              ),
            ),
          ),
      ],
    );
  }
}