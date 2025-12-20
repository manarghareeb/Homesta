import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/theming/styles.dart';

class AboutSectionItem extends StatelessWidget {
  const AboutSectionItem({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 14.5.h),
      decoration: BoxDecoration(
        border: Border.all(color: ColorManager.lightGreyColor),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Text(text, style: TextStyles.font16BlackRegular),
    );
  }
}
