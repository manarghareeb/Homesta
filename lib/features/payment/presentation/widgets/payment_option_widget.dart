import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/theming/styles.dart';

class PaymentOptionWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  final String groupValue;
  final Function(String, bool) onSelect;
  final bool isCardOption;

  const PaymentOptionWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.groupValue,
    required this.onSelect,
    this.isCardOption = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onSelect(title, isCardOption),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: ColorManager.greyColor),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Row(
          children: [
            Radio<String>(
              activeColor: ColorManager.primaryColor,
              value: title,
              groupValue: groupValue,
              onChanged: (value) => onSelect(value!, isCardOption),
            ),
            SizedBox(width: 8.w),
            Icon(icon, size: 24),
            SizedBox(width: 12.w),
            Text(title, style: TextStyles.font16DeepGeyColorRegular),
          ],
        ),
      ),
    );
  }
}
