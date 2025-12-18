import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/theming/styles.dart';

class QuantitySelectorSection extends StatefulWidget {
  const QuantitySelectorSection({super.key});

  @override
  State<QuantitySelectorSection> createState() =>
      _QuantitySelectorSectionState();
}

class _QuantitySelectorSectionState extends State<QuantitySelectorSection> {
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 4.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: Color(0xFFF0F3FF)),
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              if (quantity > 1) setState(() => quantity--);
            },
            child: Container(
              padding: EdgeInsets.all(2.h),
              decoration: BoxDecoration(
                color: ColorManager.soLightGreyColor,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Icon(Icons.remove, size: 20.sp),
            ),
          ),
          SizedBox(width: 8.w),
          Text(
            quantity.toString(),
            style: TextStyles.font13BlackW500.copyWith(fontSize: 15.sp),
          ),
          SizedBox(width: 8.w),
          GestureDetector(
            onTap: () {
              setState(() => quantity++);
            },
            child: Container(
              padding: EdgeInsets.all(2.h),
              decoration: BoxDecoration(
                color: ColorManager.primaryColor,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Icon(Icons.add, color: Colors.white, size: 20.sp),
            ),
          ),
        ],
      ),
    );
  }
}
