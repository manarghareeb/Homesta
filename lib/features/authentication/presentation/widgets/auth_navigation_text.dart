import 'package:flutter/material.dart';
import 'package:homesta/core/theming/styles.dart';

class AuthNavigationText extends StatelessWidget {
  const AuthNavigationText({
    super.key,
    required this.text,
    required this.textButton,
    required this.onTap,
  });
  final String text;
  final String textButton;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text, style: TextStyles.font16BlackRegular),
        InkWell(
          onTap: onTap,
          child: Text(
            textButton,
            style: TextStyles.font16PrimaryColorW400Underline,
          ),
        ),
      ],
    );
  }
}
