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
    this.prefixIcon,
    this.fillColor,
    this.maxLines,
    this.isFilled,
  });
  final Color? fillColor;
  final int? maxLines;
  final bool? isFilled;
  final TextEditingController controller;
  final String hintText;
  final TextInputType textInputType;
  final bool? obscureText;
  final String? Function(String?)? validator;
  final String title;
  final IconData? suffixIcon;
  final IconData? prefixIcon;

  @override
  State<CustomTextFieldWidget> createState() => _CustomTextFieldWidgetState();
}

class _CustomTextFieldWidgetState extends State<CustomTextFieldWidget> {
  bool isObscured = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: widget.obscureText == true ? 1 : widget.maxLines,

      controller: widget.controller,
      keyboardType: widget.textInputType,
      obscureText: widget.obscureText == true ? isObscured : false,
      validator: widget.validator,
      style: TextStyles.font16GreyRegular.copyWith(
        color: ColorManager.primaryColor,
      ),
      decoration: InputDecoration(
        fillColor: widget.fillColor,
        filled: widget.isFilled ?? false,

        prefixIcon:
            widget.prefixIcon != null
                ? Icon(widget.prefixIcon, color: ColorManager.lightGreyColor)
                : null,
        hintText: widget.hintText,
        hintStyle: TextStyles.font14GreyColorW400,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: BorderSide(
            color: ColorManager.lightGreyColor,
            style: BorderStyle.solid,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: BorderSide(
            color: ColorManager.lightGreyColor,
            style: BorderStyle.solid,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: BorderSide(
            color: ColorManager.lightGreyColor,
            style: BorderStyle.solid,
          ),
        ),
        suffixIcon:
            widget.obscureText == true
                ? IconButton(
                  icon: Icon(
                    isObscured
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    color: ColorManager.lightGreyColor,
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
                      color: ColorManager.lightGreyColor,
                    )
                    : null),
      ),
    );
  }
}
