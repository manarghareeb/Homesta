import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/theming/styles.dart';

class CountContainer extends StatefulWidget {
  const CountContainer({super.key, this.padding, this.onQuantityChanged});
  final EdgeInsetsGeometry? padding;
  final Function(int)? onQuantityChanged;

  @override
  State<CountContainer> createState() => _CountContainerState();
}

class _CountContainerState extends State<CountContainer> {
  int quantity = 1;

  void updateQuantity(int newQuantity) {
    setState(() {
      quantity = newQuantity;
    });
    if (widget.onQuantityChanged != null) {
      widget.onQuantityChanged!(quantity);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          widget.padding ??
          EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: ColorManager.lightGreyColor),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(6.r),
            onTap: () {
              if (quantity > 1) updateQuantity(quantity - 1);
            },
            child: SizedBox(
              width: 24.w,
              height: 24.w,
              child: Icon(Icons.remove, size: 18.sp),
            ),
          ),

          SizedBox(width: 8.w),

          SizedBox(
            width: 24.w,
            child: Text(
              quantity.toString(),
              textAlign: TextAlign.center,
              style: TextStyles.font13BlackW500.copyWith(fontSize: 15.sp),
            ),
          ),

          SizedBox(width: 8.w),

          InkWell(
            borderRadius: BorderRadius.circular(6.r),
            onTap: () => updateQuantity(quantity + 1),
            child: SizedBox(
              width: 24.w,
              height: 24.w,
              child: Icon(Icons.add, size: 18.sp),
            ),
          ),
        ],
      ),
    );
  }
}
