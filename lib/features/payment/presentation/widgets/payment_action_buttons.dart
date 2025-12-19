import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/theming/styles.dart';

class PaymentActionButtons extends StatelessWidget {
  const PaymentActionButtons({
    super.key,
    required this.leftText,
    required this.rightText,
    required this.onLeftPressed,
    required this.onRightPressed,
  });

  final String leftText;
  final String rightText;
  final VoidCallback onLeftPressed;
  final VoidCallback onRightPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextButton(
            onPressed: onLeftPressed,
            style: TextButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 14.h),
              shape: RoundedRectangleBorder(
                side: BorderSide(color: ColorManager.primaryColor),
                borderRadius: BorderRadius.circular(12.r),
              ),
            ),
            child: Text(
              leftText,
              style: TextStyles.font16PrimaryColorW400Underline.copyWith(
                decoration: TextDecoration.none,
              ),
            ),
          ),
        ),
        SizedBox(width: 16.w),
        Expanded(
          child: ElevatedButton(
            onPressed: onRightPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorManager.primaryColor,
              padding: EdgeInsets.symmetric(vertical: 14.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.r),
              ),
            ),
            child: Text(rightText, style: TextStyles.font16WhiteW500),
          ),
        ),
      ],
    );
  }
}
