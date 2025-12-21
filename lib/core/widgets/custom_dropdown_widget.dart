import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/theming/styles.dart';

class CustomDropdownWidget extends StatelessWidget {
  const CustomDropdownWidget({
    super.key,
    required this.label,
    required this.value,
    required this.items,
    required this.onChanged,
  });

  final String label; // لتحديد نوع الحقل (Country, City, State)
  final String? value;
  final List<String> items;
  final void Function(String?) onChanged;

  @override
  Widget build(BuildContext context) {
    String hint;
    if (label == 'Country') {
      hint = "Select Country";
    } else if (label == 'City') {
      hint = "Select City";
    } else {
      hint = "Select State";
    }

    return DropdownButtonFormField<String>(
      value: value,
      items: items
          .map((e) => DropdownMenuItem(
        value: e,
        child: Text(
          e,
          style: TextStyles.font14BlackColorW400,
        ),
      ))
          .toList(),
      onChanged: onChanged,
      iconEnabledColor: ColorManager.buttonColor, // لون السهم
      style: TextStyles.font14BlackColorW400.copyWith(
        color: ColorManager.buttonColor, // لون النص المختار
      ),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyles.font14GreyColorW400, // لون الـ hint
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: BorderSide(color: ColorManager.lightGreyColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: BorderSide(color: ColorManager.buttonColor), // لون البوردر عند التركيز
        ),
      ),
    );
  }
}
