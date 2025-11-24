import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/core/theming/colors.dart';

class IconTextButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isActive;
  final Function() onTap;
  const IconTextButton({
    super.key,
    required this.icon,
    required this.label,
    this.isActive = false, required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Icon(icon, color: isActive ? ColorManager.buttonColor : Colors.grey),
          SizedBox(height: 4.h),
          Text(
            label,
            style: TextStyle(color: isActive ? ColorManager.buttonColor : ColorManager.greyColor),
          ),
        ],
      ),
    );
  }
}
