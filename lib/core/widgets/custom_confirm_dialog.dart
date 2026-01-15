import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/theming/styles.dart';

Future<bool?> showCustomConfirmDialog({
  required BuildContext context,
  required String title,
  required String content,
  String confirmText = 'Yes',
  String cancelText = 'No',
  TextStyle? confirmTextStyle,
  TextStyle? cancelTextStyle,
}) {
  return showDialog<bool>(
    context: context,
    builder: (context) => AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
      ),
      title: Text(title, style: TextStyles.font16BlackW500),
      content: Text(content, style: TextStyles.font14BlackColorW400),
      actionsPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      actions: [
        OutlinedButton(
          style: OutlinedButton.styleFrom(
            side: BorderSide(color: ColorManager.primaryColor),
            foregroundColor: ColorManager.primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
          ),
          onPressed: () => Navigator.of(context).pop(false),
          child: Text(cancelText, style: cancelTextStyle ?? TextStyles.font14BlackColorW400),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: ColorManager.primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
          ),
          onPressed: () => Navigator.of(context).pop(true),
          child: Text(confirmText, style: confirmTextStyle ?? TextStyles.font14WhiteColorW400),
        ),
      ],
    ),
  );
}
