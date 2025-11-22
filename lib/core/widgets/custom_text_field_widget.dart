import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/theming/styles.dart';

class CustomTextFieldWidget extends StatefulWidget {
  const CustomTextFieldWidget({
    super.key,
    required this.controller,
    required this.hintText,
    required this.textInputType,
    this.obscureText = false,
    this.validator,
    required this.title,
    this.suffixIcon,
    required this.prefixIcon,
  });

  final TextEditingController controller;
  final String hintText;
  final TextInputType textInputType;
  final bool? obscureText;
  final String? Function(String?)? validator;
  final String title;
  final IconData? suffixIcon;
  final Widget prefixIcon;

  @override
  State<CustomTextFieldWidget> createState() => _CustomTextFieldWidgetState();
}

class _CustomTextFieldWidgetState extends State<CustomTextFieldWidget> {
  bool isObscured = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: widget.textInputType,
      obscureText: widget.obscureText == true ? isObscured : false,
      validator: widget.validator,
      style: TextStyles.font16GreyRegular.copyWith(
        color: ColorManager.buttonColor
      ),
      decoration: InputDecoration(
        prefixIcon: widget.prefixIcon,
        hintText: widget.hintText,
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
        suffixIcon:
            widget.obscureText == true
                ? IconButton(
                  icon: Icon(
                    isObscured ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                    color: ColorManager.iconTextFieldColor,
                  ),
                  onPressed: () {
                    setState(() {
                      isObscured = !isObscured;
                    });
                  },
                )
                : (widget.suffixIcon != null
                    ? Icon(
                      widget.suffixIcon,
                      color: ColorManager.iconTextFieldColor,
                    )
                    : null),
      ),
    );
  }
}
