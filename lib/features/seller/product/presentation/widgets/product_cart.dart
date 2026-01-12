import 'package:flutter/material.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/theming/styles.dart';
import 'package:homesta/features/product/domain/entities/product_entitty.dart';
import 'package:homesta/features/seller/product/presentation/widgets/image_with_edit_and_delete_icon.dart';

class ProductCard extends StatelessWidget {
  final ProductEntity product;

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
          ImageWithAddAndDeleteIcon(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product.name, style: TextStyles.font15BlackW500),
                SizedBox(height: 4),
                Text(product.categoryId.toString(), style: TextStyles.font15GreyColorW400),
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
                          backgroundColor: Colors.amber,
                        ),
                        SizedBox(width: 4),
                        Text(
                          product.colors.first,
                          style: TextStyles.font14GreyColorW400,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 4),
                Text(
                  "Stok :${product.quantity}",
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
