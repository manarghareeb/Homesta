import 'package:flutter/material.dart';
import 'package:homesta/core/theming/styles.dart';
import 'package:homesta/features/seller/analytics/presentation/widgets/analytics_product.dart';

class BestAndLeastSellingProducts extends StatelessWidget {
  const BestAndLeastSellingProducts({
    super.key,
    required this.title,
    required this.count,
    required this.nameProduct,
    required this.categoryProduct,
    required this.salesNumber,
    required this.percentage,
    required this.profit,
    required this.color,
  });
  final String title;
  final String count;
  final String nameProduct;
  final String categoryProduct;
  final String salesNumber;
  final String percentage;
  final String profit;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyles.font16BlackW500),
          SizedBox(height: 16),
          AnalyticsProduct(
            color: color,
            count: count,
            nameProduct: nameProduct,
            categoryProduct: categoryProduct,
            salesNumber: salesNumber,
            percentage: percentage,
            profit: profit,
          ),
        ],
      ),
    );
  }
}
