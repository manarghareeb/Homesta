import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/theming/styles.dart';

class TextAndTextField extends StatelessWidget {
  const TextAndTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.textInputType,
    this.validator,
    required this.textLabel,
    this.readOnly = false,

  });
  final TextEditingController controller;
  final String hintText;
  final TextInputType textInputType;
  final String? Function(String?)? validator;
  final String textLabel;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: textLabel,
            style: TextStyles.font18BlackW500.copyWith(fontSize: 16.sp),
            // children: [
            //   TextSpan(
            //     text: '*',
            //     style: TextStyle(color: ColorManager.redColor),
            //   ),
            // ],
          ),
        ),
        SizedBox(height: 8.h),
        TextFormField(
          controller: controller,
          keyboardType: textInputType,
          style: TextStyles.font14BlackColorW400,
          validator: validator,
          decoration: InputDecoration(
            hintText: hintText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide(color: ColorManager.lightGreyColor),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide(color: ColorManager.lightGreyColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide(color: ColorManager.lightGreyColor),
            ),
          ),
          readOnly: readOnly,
        ),
        SizedBox(height: 16.h),
      ],
    );
  }
}
