import 'package:flutter/material.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/theming/styles.dart';

class DescriptionRow extends StatelessWidget {
  const DescriptionRow({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10,
      children: [
        SizedBox(width: 0),
        Stack(
          clipBehavior: Clip.none,
          children: [
            CircleAvatar(backgroundColor: ColorManager.greenColor, radius: 13),
            Positioned(
              top: 3,
              bottom: 3,
              left: -5,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 10,
                child: CircleAvatar(
                  backgroundColor: ColorManager.thirdColor,
                  radius: 9,
                ),
              ),
            ),
          ],
        ),
        Expanded(child: Text(text, style: TextStyles.font14BlackColorW400)),
      ],
    );
  }
}
