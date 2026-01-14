import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/widgets/custom_cached_network_image.dart';
import 'package:homesta/features/seller/product/domain/entitiy/product_image_entity.dart';

class ProductImageGallerySection extends StatelessWidget {
  final String mainImage;
  final List<ProductImageEntity> thumbnails;

  const ProductImageGallerySection({
    super.key,
    required this.mainImage,
    required this.thumbnails,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //Image.asset(mainImage),
        CustomCachedNetworkImage(imagePath: mainImage),
        SizedBox(height: 24.h),
        Wrap(
          spacing: 20.w,
          runSpacing: 10.h,
          children: List.generate(thumbnails.length, (index) {
            return Container(
              height: 70.h,
              width: 68.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.r),
                color: Colors.white,
                border: Border.all(color: ColorManager.thirdColor),
              ),
              child:CustomCachedNetworkImage(imagePath: thumbnails[index].imageUrl),
              // Image.asset(thumbnails[index]),
            );
          }),
        ),
      ],
    );
  }
}
