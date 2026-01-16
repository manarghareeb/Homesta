import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/widgets/custom_cached_network_image.dart';
import 'package:homesta/features/product/domain/entities/product_entitty.dart';
import 'package:homesta/features/product/presentation/cubits/get_product_images_cubit.dart/get_product_images_cubit.dart';
import 'package:homesta/features/product/presentation/cubits/get_product_images_cubit.dart/get_ptoduct_image_state.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProductImageWidget extends StatelessWidget {
  const ProductImageWidget({super.key, required this.productEntity});
  final ProductEntity productEntity;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 5,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(14.r),
            child: SizedBox(
              width: double.infinity,
              height: 200.h,
              child: BlocBuilder<GetProductImagesCubit, GetPtoductImagesState>(
                builder: (context, state) {
                  if (state is GetProductImageLoading) {
                    return Skeletonizer(
                      child: ClipRRect(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(10.r),
                        ),
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          color: Colors.grey.shade300,
                        ),
                      ),
                    );
                  }
              
                  if (state is GetProductImageFailure) {
                    return Image.asset(
                      height: double.infinity,
                      width: double.infinity,
                      "assets/images/catrgories_image/bedroom.png",
                      fit: BoxFit.cover,
                    );
                  }
              
                  if (state is GetPtoductImageSuccess) {
                    final images = state.products;
              
                    if (images.isEmpty) {
                      return Image.asset(
                        height: double.infinity,
                        width: double.infinity,
                        "assets/images/catrgories_image/bedroom.png",
                        fit: BoxFit.cover,
                      );
                    }
              
                    return CustomCachedNetworkImage(
                      imagePath: images.first.imageUrl,
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                    );
                  }
              
                  return Image.asset(
                    "assets/images/catrgories_image/bedroom.png",
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
          ),

          /// Discount
          if (productEntity.discount > 0)
          Positioned(
            top: 6,
            left: 6,
            child: _badge("${productEntity.discount}% Off"),
          ),

          /// Icons
          /*Positioned(
        top: 6,
        right: 6,
        child: Column(
          children: [
            _icon(Icons.favorite_border, () {}),
            SizedBox(height: 6.h),
            _icon(Icons.shopping_cart_outlined, () {
              context.read<AddItemToCartCubit>().addItemToCart(
                    productId: productEntity.productId,
                    quantity: 1,
                    colorId: productEntity.colors.first,
                  );
            }),
          ],
        ),
      ),*/
        ],
      ),
    );
  }
}

Widget _badge(String text) {
  return Skeleton.leaf(
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
      decoration: BoxDecoration(
        color: ColorManager.primaryColor,
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white, fontSize: 11),
      ),
    ),
  );
}

/*Widget _icon(IconData icon, Function() onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.all(4.w),
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: Icon(icon, size: 16),
    ),
  );
}*/
