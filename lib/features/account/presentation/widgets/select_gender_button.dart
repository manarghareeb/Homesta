import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/theming/styles.dart';

class SelectGenderButton extends StatelessWidget {
  const SelectGenderButton({
    super.key,
    required this.selectedGender,
    required this.onTap,
    required this.text, 
    required this.gender,
  });

  final String selectedGender;
  final Function() onTap;
  final String text;
  final String gender;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 150.w,
        height: 50.h,
        decoration: BoxDecoration(
          color:
              selectedGender == gender
                  ? Color(0xFFB19470)
                  : ColorManager.mainColor,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              selectedGender == gender
                  ? 'assets/images/Check Point (1).svg'
                  : 'assets/images/Check Point.svg',
              width: 24.w,
            ),
            SizedBox(width: 12.w),
            Text(
              text,
              style: TextStyles.font16BlackRegular,
            ),
          ],
        ),
      ),
    );
  }
}
