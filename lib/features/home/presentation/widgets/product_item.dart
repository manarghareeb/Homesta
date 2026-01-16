import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:homesta/core/di/service_locator.dart';
import 'package:homesta/core/routing/app_router.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/features/home/presentation/widgets/product_image_widget.dart';
import 'package:homesta/features/product/domain/entities/product_entitty.dart';
import 'package:homesta/features/product/presentation/cubits/get_product_images_cubit.dart/get_product_images_cubit.dart';
import 'package:homesta/features/product/presentation/cubits/get_product_images_cubit.dart/get_ptoduct_image_state.dart';
import 'package:homesta/features/seller/product/domain/entitiy/product_image_entity.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.productEntity});
  final ProductEntity productEntity;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              sl<GetProductImagesCubit>()
                ..getProductImages(productEntity.productId),

      child: Builder(
        builder: (context) {
          return GestureDetector(
            onTap: () {
              final loadedImages =
                  context.read<GetProductImagesCubit>().state
                          is GetPtoductImageSuccess
                      ? (context.read<GetProductImagesCubit>().state
                              as GetPtoductImageSuccess)
                          .products
                      : <ProductImageEntity>[];
              context.push(
                AppRouter.productDetailsScreen,
                extra: {'product': productEntity, 'images': loadedImages},
              );
            },
            child: SizedBox(
              height: 260.h,
              child: Container(
                decoration: BoxDecoration(
                  color: ColorManager.soLightGreyColor,
                  borderRadius: BorderRadius.circular(15.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProductImageWidget(productEntity: productEntity),

                    SizedBox(height: 6.h),

                    /// TITLE
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              productEntity.name,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 14,
                              ),
                              SizedBox(width: 4.w),
                              Text(
                                productEntity.rating.toString(),
                                style: const TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    /// PRICE
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          if (productEntity.discount > 0) ...[
                            Expanded(
                              child: Text(
                                "${(productEntity.price * (1 - productEntity.discount / 100)).toStringAsFixed(2)} EGP",
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(width: 6.w),
                            Text(
                              "${productEntity.price}",
                              style: const TextStyle(
                                color: Colors.grey,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                          ] else ...[
                            Expanded(
                              child: Text(
                                "${productEntity.price} EGP",
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
