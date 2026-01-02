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
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 4,
        children: [
          Text(
            text,
            style: TextStyles.font16BlackRegular,
            textAlign: TextAlign.center,
          ),
          GestureDetector(
            onTap: onTap,
            child: Text(
              textButton,
              style: TextStyles.font16PrimaryColorW400Underline,
            ),
          ),
        ],
      ),
    );
  }
}
