import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/theming/styles.dart';

class PaymentContainerItem extends StatelessWidget {
  const PaymentContainerItem({
    super.key,
    required this.isSelected,
    this.onTap,
    required this.icon,
    required this.text,
    required this.subText,
  });

  final bool isSelected;
  final VoidCallback? onTap;
  final IconData icon;
  final String text;
  final String subText;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
        decoration: BoxDecoration(
          color: isSelected ? ColorManager.aliceBlue : Colors.white,
          borderRadius: BorderRadius.circular(15.r),
          border: Border.all(
            color: isSelected ? ColorManager.blackColor : ColorManager.greyColor,
            width: 1.5,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 30.sp,
              color: ColorManager.blackColor,
            ),
            SizedBox(width: 8.5.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text,
                  style: TextStyles.font18BlackW500.copyWith(fontSize: 15.sp),
                ),
                SizedBox(height: 4.h),
                Text(
                  subText,
                  style: TextStyles.font14GreyColorW400,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
