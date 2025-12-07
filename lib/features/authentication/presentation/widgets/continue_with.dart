import 'package:flutter/material.dart';
import 'package:homesta/core/theming/styles.dart';

class ContinueWith extends StatelessWidget {
  const ContinueWith({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            thickness: 1,
            color: Color(0xFFE0DFDF),
            endIndent: 8,
          ),
        ),
        Text(
          'Or Continue With',
          style: TextStyles.font16BlackRegular,
        ),
        Expanded(
          child: Divider(
            thickness: 1,
            color:Color(0xFFE0DFDF),
            indent: 8,
          ),
        ),
      ],
    );
  }
}
