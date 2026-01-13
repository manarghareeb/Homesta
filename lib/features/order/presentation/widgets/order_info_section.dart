import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/theming/styles.dart';

class OrderInfoItem {
  final String label;
  final String value;

  OrderInfoItem({
    required this.label,
    required this.value,
  });
}

class OrderInfoSection extends StatelessWidget {
  final List<OrderInfoItem> items;

  const OrderInfoSection({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (int i = 0; i < items.length; i++) ...[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(items[i].label, style: TextStyles.font14GreyColorW400),
                SizedBox(height: 4.h),
                Text(items[i].value, style: TextStyles.font14BlackColorW500),
              ],
            ),
          ),
          if (i != items.length - 1)
            SizedBox(
              height: 40.h,
              child: VerticalDivider(
                color: ColorManager.lightGreyColor,
                thickness: 2,
              ),
            ),
        ],
      ],
    );
  }
}
