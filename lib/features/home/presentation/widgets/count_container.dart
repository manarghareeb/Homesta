import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/theming/styles.dart';

class CountContainer extends StatefulWidget {
  const CountContainer({super.key, this.padding});
  final EdgeInsetsGeometry? padding;

  @override
  State<CountContainer> createState() => _CountContainerState();
}

class _CountContainerState extends State<CountContainer> {
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: widget.padding ?? EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: ColorManager.lightGreyColor),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: () {
              if (quantity > 1) setState(() => quantity--);
            },
            child: Icon(Icons.remove, size: 18.sp),
          ),
          SizedBox(width: 8.w),
          Text(
            quantity.toString(),
            style: TextStyles.font13BlackW500.copyWith(fontSize: 15.sp),
          ),
          SizedBox(width: 8.w),
          GestureDetector(
            onTap: () => setState(() => quantity++),
            child: Icon(Icons.add, size: 18.sp),
          ),
        ],
      ),
    );
  }
}
