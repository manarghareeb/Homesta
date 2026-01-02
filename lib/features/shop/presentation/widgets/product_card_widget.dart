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
          Expanded(
            flex: 6,
            child: Container(
              decoration: BoxDecoration(
                color: const Color.fromRGBO(246, 246, 246, 1),
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Stack(
                children: [
                  Center(
                    child: Image.asset(
                      image,
                      fit: BoxFit.contain,
                      height: 90.h,
                    ),
                  ),

                  /// DISCOUNT
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
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: const Text(
                        '25% Off',
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
          ),

          /// CONTENT
          Expanded(
            flex: 4,
            child: Padding(
              padding: EdgeInsets.all(10.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyles.font14BlackColorW400,
                  ),

                  SizedBox(height: 8.h),

                  Row(
                    children: [
                      Text(
                        '\$${price.toStringAsFixed(2)}',
                        style: TextStyles.font14BlackColorW400,
                      ),
                      SizedBox(width: 6.w),
                      Text(
                        '\$${oldPrice.toStringAsFixed(2)}',
                        style: const TextStyle(
                          color: ColorManager.greyColor,
                          decoration: TextDecoration.lineThrough,
                          fontSize: 10,
                        ),
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.star,
                        size: 16,
                        color: ColorManager.yellowColor,
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        rating.toString(),
                        style: TextStyles.font14BlackColorW400,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
