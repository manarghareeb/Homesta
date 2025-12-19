import 'package:flutter/material.dart';
import 'package:homesta/core/theming/styles.dart';

class PaymentCheckboxRow extends StatelessWidget {
  const PaymentCheckboxRow({
    super.key,
    required this.value,
    required this.onChanged,
    this.text,
    this.richText,
    this.textStyle,
  });

  final bool value;
  final ValueChanged<bool> onChanged;
  final String? text;
  final InlineSpan? richText;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: value,
          onChanged: (v) => onChanged(v ?? false),
          activeColor: const Color.fromARGB(255, 52, 199, 89),
        ),
        Expanded(
          child:
              richText != null
                  ? RichText(
                    text: TextSpan(
                      style: TextStyles.font14BlackColorW400,
                      children: [richText!],
                    ),
                  )
                  : Text(text ?? '', style: textStyle ?? TextStyles.font14BlackColorW400),
        ),
      ],
    );
  }
}
