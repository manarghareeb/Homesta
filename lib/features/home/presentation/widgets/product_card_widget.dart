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
      height: 260.h, // ✅ يمنع overflow
      child: Container(
        padding: EdgeInsets.all(10.w),
        decoration: BoxDecoration(
          color: const Color(0xffE0DFDF),
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// IMAGE
            Expanded(
              flex: 5,
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(14.r),
                    child: Image.asset(
                      imagePath,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),

                  /// Discount
                  Positioned(top: 6, left: 6, child: _badge(discount)),

                  /// Icons
                  Positioned(
                    top: 6,
                    right: 6,
                    child: Column(
                      children: [
                        _icon(Icons.favorite_border),
                        SizedBox(height: 6.h),
                        _icon(Icons.shopping_cart_outlined),
                      ],
                    ),
                  ),

                  /// Timer
                  if (showTimer)
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 4.h),
                        decoration: BoxDecoration(
                          color: ColorManager.primaryColor,
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: const Text(
                          '05 : 12 : 30 : 25',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 11),
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
                const Icon(Icons.star, color: Colors.amber, size: 14),
                SizedBox(width: 4.w),
                Text(rating.toString(), style: const TextStyle(fontSize: 12)),
              ],
            ),

            SizedBox(height: 4.h),

            /// PRICE
            Row(
              children: [
                Text(
                  price,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 6.w),
                Text(
                  oldPrice,
                  style: const TextStyle(
                    color: Colors.grey,
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

  Widget _badge(String text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
      decoration: BoxDecoration(
        color: ColorManager.primaryColor,
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white, fontSize: 11),
      ),
    );
  }

  Widget _icon(IconData icon) {
    return Container(
      padding: EdgeInsets.all(4.w),
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: Icon(icon, size: 16),
    );
  }
}
