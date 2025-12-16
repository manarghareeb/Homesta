import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/theming/styles.dart';

class TotalPriceAndAddToCardSection extends StatelessWidget {
  const TotalPriceAndAddToCardSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Text('Total Price', style: TextStyles.font14BlackColorW400),
            SizedBox(height: 8.h),
            Text('\$129.00', style: TextStyles.font16BlackRegular.copyWith(
              color: ColorManager.thirdColor
            )),
          ],
        ),
        Container(
          height: 48.h,
          width: 168.w,
          decoration: BoxDecoration(
            color: ColorManager.primaryColor,
            borderRadius: BorderRadius.circular(15.r),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Add to Cart',
                style: TextStyles.font16WhiteW500.copyWith(
                  fontSize: 18.sp
                ),
              ),
              SizedBox(width: 8.w),
              SvgPicture.asset('assets/images/Frame 1984079298.svg')
            ],
          ),
        ),
      ],
    );
  }
}
