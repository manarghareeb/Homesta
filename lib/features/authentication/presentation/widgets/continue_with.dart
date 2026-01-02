import 'package:flutter/material.dart';
import 'package:homesta/core/theming/styles.dart';

class ContinueWith extends StatelessWidget {
  const ContinueWith({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      alignment: WrapAlignment.center,
      spacing: 8,
      children: [
        SizedBox(
          width: 80,
          child: Divider(thickness: 1, color: const Color(0xFFE0DFDF)),
        ),
        Text('Or Continue With', style: TextStyles.font16BlackRegular),
        SizedBox(
          width: 80,
          child: Divider(thickness: 1, color: const Color(0xFFE0DFDF)),
        ),
      ],
    );
  }
}
