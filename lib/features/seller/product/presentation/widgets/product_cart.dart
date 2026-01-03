import 'package:flutter/material.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/theming/styles.dart';
import 'package:homesta/features/seller/product/data/models/product_seller_model.dart';
import 'package:homesta/features/seller/product/presentation/widgets/image_with_edit_and_delete_icon.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ImageWithAddAndDeleteIcon(product: product),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product.name, style: TextStyles.font15BlackW500),
                SizedBox(height: 4),
                Text(product.category, style: TextStyles.font15GreyColorW400),
                SizedBox(height: 4),
                Text(
                  product.description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyles.font14deepGreyColorW400.copyWith(
                    fontSize: 12,
                  ),
                ),
                SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$${product.price}",
                      style: TextStyles.font14BlackColorW500,
                    ),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 7,
                          backgroundColor: product.colorValue,
                        ),
                        SizedBox(width: 4),
                        Text(
                          product.colorName,
                          style: TextStyles.font14GreyColorW400,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 4),
                Text(
                  "Stok :${product.stock}",
                  style: TextStyles.font13LightGreyW500.copyWith(
                    color: ColorManager.greyColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
