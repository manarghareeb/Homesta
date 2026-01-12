import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/theming/styles.dart';

class OrderSummaryInCheckout extends StatelessWidget {
  const OrderSummaryInCheckout({
    super.key,
    required this.itemsCount,
    required this.subTotal,
    required this.shipping,
    required this.taxes,
    //required this.discount,
    required this.total,
  });
  final int itemsCount;
  final double subTotal;
  final double shipping;
  final double taxes;
  //final double discount;
  final double total;

  @override
  Widget build(BuildContext context) {
    final orderItems = [
      {'title': 'Item', 'value': itemsCount.toString()},
      {'title': 'Sub Total', 'value': '\$${subTotal.toStringAsFixed(2)}'},
      {'title': 'Shipping', 'value': '\$${shipping.toStringAsFixed(2)}'},
      {'title': 'Taxes', 'value': '\$${taxes.toStringAsFixed(2)}'},
      //{'title': 'Coupon Discount', 'value': '-\$${discount.toStringAsFixed(2)}'},
      {
        'title': 'Total',
        'value': '\$${total.toStringAsFixed(2)}',
        'isTotal': true,
      },
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Order Summary', style: TextStyles.font20BlackColorW500),
        SizedBox(height: 16.h),
        Column(
          children:
              orderItems.map((item) {
                final bool isTotal = (item['isTotal'] as bool?) ?? false;
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
                          item['title'] as String,
                          style: TextStyles.font16BlackRegular,
                        ),
                        Text(
                          item['value'] as String,
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
