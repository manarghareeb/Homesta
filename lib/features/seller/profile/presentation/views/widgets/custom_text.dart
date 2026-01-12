import 'package:flutter/material.dart';
import 'package:homesta/core/theming/styles.dart';

class CustomText extends StatelessWidget {
  const CustomText({super.key, required this.text});
final String text;
  @override
  Widget build(BuildContext context) {
    return  Text(text, style: TextStyles.font13BlackW500,);
  }
}