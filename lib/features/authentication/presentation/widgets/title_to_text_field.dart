import 'package:flutter/material.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/theming/styles.dart';

class TitleToTextField extends StatelessWidget {
  const TitleToTextField({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: title,
            style: TextStyles.font16BlackRegular,
            children: [
              TextSpan(
                text: '*',
                style: TextStyle(color: ColorManager.redColor),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
