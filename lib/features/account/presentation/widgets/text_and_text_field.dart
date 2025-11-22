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
    required this.text,
  });
  final TextEditingController controller;
  final String hintText;
  final TextInputType textInputType;
  final String? Function(String?)? validator;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: TextStyles.font18BlackW500.copyWith(fontSize: 16.sp),
          textAlign: TextAlign.start,
        ),
        TextFormField(
          controller: controller,
          keyboardType: textInputType,
          style: TextStyles.font16GreyRegular.copyWith(
            color: ColorManager.buttonColor,
          ),
          validator: validator,
          decoration: InputDecoration(
            hintText: hintText,
            filled: true,
            fillColor: ColorManager.mainColor,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        SizedBox(height: 24.h,),
      ],
    );
  }
}
