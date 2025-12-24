import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theming/styles.dart';

class ContactRowWidget extends StatelessWidget {
  final IconData? icon;
  final String? imagePath;
  final String text;

  const ContactRowWidget({
    super.key,
    this.icon,
    this.imagePath,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    // شرط اللون للواتساب
    final bool isWhatsApp = text.toLowerCase().contains("whatsapp");
    final Color textColor = isWhatsApp ? const Color(0xff18D92F) : Colors.black;

    return Row(
      children: [
        if (icon != null) ...[
          Icon(icon, size: 24.sp, color: Colors.black),
        ] else if (imagePath != null) ...[
          Image.asset(imagePath!, width: 18.w, height: 18.w, fit: BoxFit.contain),
        ],
        SizedBox(width: 12.w),
        Expanded(
          child: Text(
            text,
            style: TextStyles.font14BlackColorW400.copyWith(color: textColor),
          ),
        ),
      ],
    );
  }
}
