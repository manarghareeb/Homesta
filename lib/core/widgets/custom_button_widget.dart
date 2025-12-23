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
    this.backgroundColor,
    this.textColor,
    this.minWidth,
    this.height,
    this.raduis
  });

  final String buttonText;
  final VoidCallback onPressed;
  final bool isPrimary;
  final double? raduis;

  /// ألوان اختيارية
  final Color? backgroundColor;
  final Color? textColor;

  /// حجم اختياري
  final double? minWidth;
  final double? height;

  @override
  Widget build(BuildContext context) {
    final Color bgColor =
        backgroundColor ??
        (isPrimary ? ColorManager.primaryColor : Colors.white);
    final Color txtColor =
        textColor ?? (isPrimary ? Colors.white : ColorManager.primaryColor);

    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        backgroundColor: bgColor,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        minimumSize: Size(minWidth ?? double.infinity, height ?? 48.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(raduis ??25.r),
          side: BorderSide(
            color: isPrimary ? Colors.transparent : ColorManager.primaryColor,
          ),
        ),
      ),
      child: Text(
        buttonText,
        style: TextStyles.font16WhiteW500.copyWith(color: txtColor),
      ),
    );
  }
}
