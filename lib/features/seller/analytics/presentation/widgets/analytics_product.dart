import 'package:flutter/material.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/theming/styles.dart';

class AnalyticsProduct extends StatelessWidget {
  const AnalyticsProduct({
    super.key,
    required this.count,
    required this.nameProduct,
    required this.categoryProduct,
    required this.salesNumber,
    required this.percentage,
    required this.profit,
    required this.color,
  });
  final String count;
  final String nameProduct;
  final String categoryProduct;
  final String salesNumber;
  final String percentage;
  final String profit;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 13),
          decoration: BoxDecoration(
            color: ColorManager.soLightGreyColor,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: ColorManager.lightGreyIconColor),
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: color,
                  radius: 12,
                  child: Text(
                    count,
                    style: TextStyles.font16WhiteW500.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SizedBox(width: 4),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(nameProduct, style: TextStyles.font13BlackW500),
                    SizedBox(height: 4),
                    Text(
                      categoryProduct,
                      style: TextStyles.font12GreyColorW400,
                    ),
                  ],
                ),
                SizedBox(width: 4),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Sales', style: TextStyles.font12GreyColorW400),
                    SizedBox(height: 8),
                    Text(salesNumber, style: TextStyles.font13BlackColorW400),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Percentage', style: TextStyles.font12GreyColorW400),
                    SizedBox(height: 8),
                    Text(percentage, style: TextStyles.font13BlackColorW400),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Profit', style: TextStyles.font12GreyColorW400),
                    SizedBox(height: 8),
                    Text(profit, style: TextStyles.font13BlackColorW400),
                  ],
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 16),
      ],
    );
  }
}
