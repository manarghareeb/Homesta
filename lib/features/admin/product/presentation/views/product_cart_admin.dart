import 'package:flutter/material.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/theming/styles.dart';
import 'package:homesta/features/product/domain/entities/product_entitty.dart';

class ProductCardAdmin extends StatelessWidget {
  final ProductEntity product;

  const ProductCardAdmin({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // مؤقتاً صورة ثابتة لحد ما تربطي الصور من الـ API
            Image.asset("assets/images/chair.png", height: 120),
            const SizedBox(height: 8),
            Text(product.name, style: TextStyles.font15BlackW500),
            const SizedBox(height: 4),
            Text(product.description,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyles.font14deepGreyColorW400.copyWith(fontSize: 12)),
            const SizedBox(height: 4),
            Text("\$${product.price}", style: TextStyles.font14BlackColorW500),
            const SizedBox(height: 4),
            Text("Stock: ${product.quantity}",
                style: TextStyles.font13LightGreyW500.copyWith(color: ColorManager.greyColor)),
          ],
        ),
      ),
    );
  }
}
