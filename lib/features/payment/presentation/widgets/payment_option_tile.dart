import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/core/theming/styles.dart';

class PaymentOptionTile extends StatelessWidget {
  const PaymentOptionTile({
    super.key,
    required this.value,
    required this.groupValue,
    required this.title,
    required this.trailing,
    required this.onChanged,
  });

  final String value; 
  final String groupValue; 
  final String title;
  final Widget trailing;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    final bool isSelected = groupValue == value;

    return InkWell(
      onTap: () => onChanged(value),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h),
        child: Row(
          children: [
            Container(
              width: 20.w,
              height: 20.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color:
                    isSelected ? const Color(0xFF4CAF50) : Colors.transparent,
                border: Border.all(
                  color: isSelected
                      ? const Color(0xFF4CAF50)
                      : Colors.grey.shade400,
                  width: 2,
                ),
              ),
              child: isSelected
                  ? Icon(Icons.check, size: 14.sp, color: Colors.white)
                  : null,
            ),
            SizedBox(width: 12.w),
            Text(
              title,
              style: isSelected ? TextStyles.font16BlackRegular.copyWith(
                color: Color(0xFF34C759)
              ) : TextStyles.font16BlackRegular,
            ),
            const Spacer(),
            trailing,
          ],
        ),
      ),
    );
  }
}
