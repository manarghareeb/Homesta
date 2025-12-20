import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/theming/styles.dart';

class CustomerSupportInfoItem extends StatelessWidget {
  const CustomerSupportInfoItem({
    super.key,
    required this.icon,
    required this.text1,
    required this.text2,
    required this.text3,
  });
  final IconData icon;
  final String text1;
  final String text2;
  final String text3;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(color: ColorManager.lightGreyColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: ColorManager.primaryColor,
            child: Icon(icon, color: Colors.white),
          ),
          SizedBox(height: 8.h),
          Text(
            text1,
            style: TextStyles.font14PrimaryColorW400.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            text2,
            style: TextStyles.font13BlackW500.copyWith(
              color: ColorManager.deepGreyColor,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            text3,
            style: TextStyles.font14PrimaryColorW400.copyWith(fontSize: 13.sp),
          ),
        ],
      ),
    );
  }
}
