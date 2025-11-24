import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/theming/styles.dart';

class RecentSearchSection extends StatelessWidget {
  const RecentSearchSection({
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
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Sofa Chair',
                style: TextStyles.font13BrownW400,
              ),
              SizedBox(width: 8.w),
              InkWell(
                onTap: () {},
                child: Icon(
                  Icons.close,
                  size: 16.sp,
                  color: ColorManager.greyColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
