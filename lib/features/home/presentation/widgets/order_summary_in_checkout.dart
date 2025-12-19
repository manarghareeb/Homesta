import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/theming/styles.dart';

class OrderSummaryInCheckout extends StatelessWidget {
  const OrderSummaryInCheckout({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> orderItems = [
      {'title': 'Item', 'value': '3'},
      {'title': 'Sub Total', 'value': '\$720'},
      {'title': 'Shopping', 'value': '00'},
      {'title': 'Taxes', 'value': '00'},
      {'title': 'Coupon Discount', 'value': '-\$100'},
      {'title': 'Total', 'value': '\$620', 'isTotal': true},
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Order Summary', style: TextStyles.font20BlackColorW500),
        SizedBox(height: 16.h),
        Column(
          children:
              orderItems.map((item) {
                final bool isTotal = item['isTotal'] ?? false;
                return Column(
                  children: [
                    if (isTotal) ...[
                      Divider(height: 1, color: ColorManager.lightGreyColor),
                      SizedBox(height: 16.h),
                    ],
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          item['title'],
                          style: TextStyles.font16BlackRegular,
                        ),
                        Text(
                          item['value'],
                          style: TextStyles.font16BlackRegular,
                        ),
                      ],
                    ),
                    if (!isTotal) SizedBox(height: 16.h),
                  ],
                );
              }).toList(),
        ),
      ],
    );
  }
}
