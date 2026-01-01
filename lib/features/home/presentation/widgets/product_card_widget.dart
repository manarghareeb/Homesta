import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/core/theming/colors.dart';

class ProductCardWidget extends StatelessWidget {
  final String imagePath;
  final String title;
  final String price;
  final String oldPrice;
  final String discount;
  final double rating;
  final bool showTimer;

  const ProductCardWidget({
    super.key,
    required this.imagePath,
    required this.title,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.rating,
    this.showTimer = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 260.h,
      child: Container(
        padding: EdgeInsets.all(10.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// IMAGE
            Container(
              height: 200.h,
              decoration: BoxDecoration(
                color: ColorManager.lightGreyIconColor,
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16.r),
                    child: Image.asset(
                      imagePath,
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),

                  /// Discount
                  Positioned(
                    top: 8,
                    left: 8,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                        vertical: 5.h,
                      ),
                      decoration: BoxDecoration(
                        color: ColorManager.primaryColor,
                        borderRadius: BorderRadius.circular(14.r),
                      ),
                      child: Text(
                        discount,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),

                  /// Icons
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Column(
                      children: [
                        _circleIcon(Icons.favorite_border),
                        SizedBox(height: 6.h),
                        _circleIcon(Icons.shopping_cart_outlined),
                      ],
                    ),
                  ),

                  /// TIMER
                  if (showTimer)
                    Positioned(
                      bottom: 8,
                      left: 12,
                      right: 12,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 6.h,
                          horizontal: 12.w,
                        ),
                        decoration: BoxDecoration(
                          color: ColorManager.primaryColor,
                          borderRadius: BorderRadius.circular(14.r),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            _TimeBox(value: "05", label: "Days"),
                            _TimeBox(value: "12", label: "Hours"),
                            _TimeBox(value: "30", label: "Mins"),
                            _TimeBox(value: "25", label: "Sec"),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),

            SizedBox(height: 6.h),

            /// TITLE
            Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),

            SizedBox(height: 4.h),

            /// RATING
            Row(
              children: [
                const Icon(Icons.star, color: Colors.amber, size: 16),
                SizedBox(width: 4.w),
                Text(rating.toString()),
              ],
            ),

            SizedBox(height: 6.h),

            /// PRICE
            Row(
              children: [
                Text(
                  price,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
                SizedBox(width: 6.w),
                Text(
                  oldPrice,
                  style: const TextStyle(
                    color: ColorManager.greyColor,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _circleIcon(IconData icon) {
    return Container(
      padding: EdgeInsets.all(6.w),
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: Icon(icon, size: 18),
    );
  }
}

class _TimeBox extends StatelessWidget {
  final String value;
  final String label;

  const _TimeBox({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: const TextStyle(color: Colors.white70, fontSize: 10),
        ),
      ],
    );
  }
}
