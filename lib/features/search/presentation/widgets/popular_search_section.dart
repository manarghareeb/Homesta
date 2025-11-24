import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/theming/styles.dart';

class PopularSearchSection extends StatelessWidget {
  const PopularSearchSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 16.w, 
      runSpacing: 8.h,
      children: List.generate(4,
        (index) => Container(
          padding: EdgeInsets.symmetric(
            horizontal: 12.w,
            vertical: 8.h,
          ),
          decoration: BoxDecoration(
            color: ColorManager.brounColor,
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Text(
            'Chair',
            style: TextStyles.font13BrownW400.copyWith(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}