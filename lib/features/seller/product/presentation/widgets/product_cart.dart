import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/core/di/service_locator.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/theming/styles.dart';
import 'package:homesta/features/product/domain/entities/product_entitty.dart';
import 'package:homesta/features/product/presentation/cubits/get_product_images_cubit.dart/get_product_images_cubit.dart';
import 'package:homesta/features/seller/product/presentation/widgets/image_with_edit_and_delete_icon.dart';

class ProductCard extends StatelessWidget {
  final ProductEntity product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    Color parseColor(String colorString) {
      if (colorString.startsWith('#')) {
        return Color(
          int.parse(colorString.substring(1), radix: 16) + 0xFF000000,
        );
      }
      switch (colorString.toLowerCase()) {
        case 'green':
          return Colors.green;
        case 'black':
          return Colors.black;
        case 'orange':
          return Colors.orange;
        case 'grey':
          return Colors.grey;
        case 'yellow':
          return Colors.yellow;
        default:
          return Colors.grey;
      }
    }

    return BlocProvider(
      create:
          (context) =>
              sl<GetProductImagesCubit>()..getProductImages(product.productId),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImageWithAddAndDeleteIcon(productEntity: product),

            //ProductImageWidget(productEntity: product),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Name: ${product.name}',
                    style: TextStyles.font15BlackW500,
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Categoty ID: ${product.categoryId.toString()}',
                    style: TextStyles.font15GreyColorW400,
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Description: ${product.description}',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyles.font14deepGreyColorW400.copyWith(
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "Price: \$${product.price}",
                    style: TextStyles.font14BlackColorW500,
                  ),
                  SizedBox(height: 4),
                  Wrap(
                    spacing: 8.w,
                    children:
                        product.colors.map((colorName) {
                          final color = parseColor(colorName);
                          return Container(
                            height: 24.h,
                            width: 24.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: color,
                            ),
                          );
                        }).toList(),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "Stok :${product.quantity}",
                    style: TextStyles.font13LightGreyW500.copyWith(
                      color: ColorManager.greyColor,
                    ),
                  ),
                  SizedBox(height: 8),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
