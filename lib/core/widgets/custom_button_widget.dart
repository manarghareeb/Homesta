import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/theming/styles.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({
    super.key, 
    required this.buttonText, 
    required this.onPressed, 
    this.isPrimary = true, 
  });
  final String buttonText;
  final VoidCallback onPressed;
  final bool isPrimary;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        backgroundColor: isPrimary ? ColorManager.primaryColor : Colors.white,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        minimumSize: Size(double.infinity, 48.w),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.r),
          side: BorderSide(
            color: isPrimary ? Colors.transparent : ColorManager.primaryColor
          )
        ),
      ),
      child: Text(
        buttonText, 
        style: isPrimary ? TextStyles.font16WhiteW500 : TextStyles.font16WhiteW500.copyWith(
          color: ColorManager.primaryColor,
        )
      ),
    );
  }
}