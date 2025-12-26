import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/theming/styles.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final String image;
  final double price;
  final double oldPrice;
  final double rating;

  const ProductCard({
    super.key,
    required this.title,
    required this.image,
    required this.price,
    required this.oldPrice,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 120.h,
            decoration: BoxDecoration(
              color: ColorManager.soLightGreyColor,
              borderRadius: BorderRadius.all(Radius.circular(15.r)),
            ),
            child: Stack(
              children: [
                Center(
                  child: Image.asset(image, height: 80.h, fit: BoxFit.contain),
                ),
                Positioned(
                  top: 8,
                  left: 8,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.w,
                      vertical: 4.h,
                    ),
                    decoration: BoxDecoration(
                      color: ColorManager.primaryColor,
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                    child: const Text(
                      '10% Off',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          /// 🧾 CONTENT
          Padding(
            padding: EdgeInsets.all(10.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyles.font14BlackColorW400,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Spacer(),
                    const Icon(Icons.shopping_cart_outlined, size: 18),
                  ],
                ),
                const SizedBox(height: 4),

                Row(
                  children: [
                    Text('\$$price', style: TextStyles.font14BlackColorW400),
                    const SizedBox(width: 6),
                    Text(
                      '\$$oldPrice',
                      style: TextStyle(
                        decoration: TextDecoration.lineThrough,
                        color: ColorManager.greyColor,
                        fontSize: 12,
                      ),
                    ),
                    Spacer(),
                    const Icon(
                      Icons.star,
                      color: ColorManager.yellowColor,
                      size: 16,
                    ),
                    Text(
                      rating.toString(),
                      style: TextStyles.font14BlackColorW400,
                    ),
                    const Spacer(),
                  ],
                ),

                const SizedBox(height: 6),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
