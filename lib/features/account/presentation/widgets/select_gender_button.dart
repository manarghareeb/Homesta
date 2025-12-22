import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/theming/styles.dart';

class SelectGenderButton extends StatefulWidget {
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
  State<SelectGenderButton> createState() => _SelectGenderButtonState();
}

class _SelectGenderButtonState extends State<SelectGenderButton> {
  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: 150.w,
        height: 50.h,
        decoration: BoxDecoration(
          border: Border.all(color: ColorManager.greyColor),
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 20.w,
              height: 20.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color:
                    widget.selectedGender == widget.gender
                        ? ColorManager.primaryColor
                        : Colors.white,
                border: Border.all(
                  color: widget.selectedGender == widget.gender
                        ? Color(0xFF34C759)
                        : ColorManager.greyColor, 
                  width: 2
                ),
              ),
            ),
            SizedBox(width: 8.w),
            Text(widget.text, style: TextStyles.font16BlackRegular),
          ],
        ),
      ),
    );
  }
}
