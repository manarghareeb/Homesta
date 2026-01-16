import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/core/widgets/custom_cached_network_image.dart';
import 'package:homesta/features/product/domain/entities/product_entitty.dart';
import 'package:homesta/features/product/presentation/cubits/get_product_images_cubit.dart/get_product_images_cubit.dart';
import 'package:homesta/features/product/presentation/cubits/get_product_images_cubit.dart/get_ptoduct_image_state.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomProductImage extends StatelessWidget {
  const CustomProductImage({super.key, required this.productEntity});
final ProductEntity productEntity;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(14.r),
        child: BlocBuilder<GetProductImagesCubit, GetPtoductImagesState>(
          builder: (context, state) {
            if (state is GetProductImageLoading) {
              return Skeletonizer(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(14.r),
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
                "assets/images/catrgories_image/bedroom.png",
                fit: BoxFit.cover,
              );
            }

            if (state is GetPtoductImageSuccess) {
              final images = state.products;

              if (images.isEmpty) {
                return Image.asset(
                  "assets/images/catrgories_image/bedroom.png",
                  fit: BoxFit.cover,
                );
              }

              return CustomCachedNetworkImage(imagePath: images.first.imageUrl);
            }

            return Image.asset(
              "assets/images/catrgories_image/bedroom.png",
              fit: BoxFit.cover,
            );
          },
        ),
      );
  }
}