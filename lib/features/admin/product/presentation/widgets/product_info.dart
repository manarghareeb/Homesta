import 'package:flutter/material.dart';
import 'package:homesta/core/theming/colors.dart';

class ProductInfo extends StatelessWidget {
  const ProductInfo({
    super.key,
    required this.productName,
    required this.productImage,
    required this.price,
    required this.stock,
    required this.category,
    required this.company,
  });
  final String productImage;
  final String productName;
  final String price;
  final int stock;
  final String category;
  final String company;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(productImage, width: 50, height: 50),
          SizedBox(width: 4),
          Text(productName),
          SizedBox(width: 8),
          Text(price),
          SizedBox(width: 8),
          Text('$stock'),
          SizedBox(width: 8),
          Text(category),
          SizedBox(width: 8),
          Text(company),
          SizedBox(width: 8),
          Icon(Icons.delete_outline_outlined, color: ColorManager.redColor),
        ],
      ),
    );
  }
}
