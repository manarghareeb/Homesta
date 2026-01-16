import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/theming/styles.dart';
import 'package:homesta/features/product/domain/entities/product_entitty.dart';

import '../../../../../core/api/end_ponits.dart';
import '../../../../product/presentation/cubits/get_product_images_cubit.dart/get_product_images_cubit.dart';
import '../../../../product/presentation/cubits/get_product_images_cubit.dart/get_ptoduct_image_state.dart';

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
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocBuilder<GetProductImagesCubit, GetPtoductImagesState>(
              builder: (context, state) {
                if (state is GetProductImageLoading) {
                  return const SizedBox(
                    height: 120,
                    child: Center(child: CircularProgressIndicator(
                      backgroundColor: Colors.blue,
                    )),
                  );
                } else if (state is GetPtoductImageSuccess) {
                  if (state.products.isNotEmpty) {
                    return Image.network(
                      "${EndPoint.baseUrl}${state.products.first.imageUrl}",
                      height: 150.h,
                      width: 150.w,
                      fit: BoxFit.cover,
                    );
                  } else {
                    return const SizedBox(
                      height: 120,
                      child: Center(child: Text("No image")),
                    );
                  }
                } else if (state is GetProductImageFailure) {
                  return const SizedBox(
                    height: 120,
                    child: Center(child: Icon(Icons.error, color: Colors.red)),
                  );
                } else {
                  return const SizedBox(
                    height: 120,
                    child: Center(child: Text("No image")),
                  );
                }
              },
            ),
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
