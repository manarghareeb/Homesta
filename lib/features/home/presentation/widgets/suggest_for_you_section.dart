import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/theming/styles.dart';

class SuggestForYouSection extends StatelessWidget {
  const SuggestForYouSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.all(8.w),
            width: 160.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset(
                    'assets/images/chair.png',
                    height: 90.h, width: 140.w,
                  ),
                ),
                SizedBox(height: 8.h),
                Divider(color: ColorManager.brounColor),
                SizedBox(height: 8.h),
                Text(
                  'Modern Chair', style: TextStyles.font13BrownW400,
                  textAlign: TextAlign.start,
                ),
                SizedBox(height: 8.h),
                Text(
                  '\$120', 
                  style: TextStyles.font13BrownW400.copyWith(
                    color: ColorManager.blackColor
                  ),
                  textAlign: TextAlign.start,
                ),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) => SizedBox(width: 16.w),
        itemCount: 4,
      ),
    );
  }
}



