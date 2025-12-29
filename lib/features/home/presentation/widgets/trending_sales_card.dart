import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/core/theming/colors.dart';

class TrendingSalesCard extends StatelessWidget {
  final String image;
  final String badgeText;
  final String title;
  final double rating;
  final String price;
  final String? oldPrice;

  const TrendingSalesCard({
    super.key,
    required this.image,
    required this.badgeText,
    required this.title,
    required this.rating,
    required this.price,
    this.oldPrice,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 170.w,
      height: 240.h, // ✅ ثبات الارتفاع
      child: Container(
        padding: EdgeInsets.all(10.w),
        decoration: BoxDecoration(
          color: ColorManager.soLightGreyColor,
          borderRadius: BorderRadius.circular(15.r),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 8),
          ],
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
                    borderRadius: BorderRadius.circular(15.r),
                    child: Image.asset(
                      image,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),

                  Positioned(
                    top: 8,
                    left: 8,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.w,
                        vertical: 3.h,
                      ),
                      decoration: BoxDecoration(
                        color: ColorManager.primaryColor,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Text(
                        badgeText,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ),

                  Positioned(
                    top: 8,
                    right: 8,
                    child: const Icon(
                      Icons.favorite_border,
                      color: Colors.red,
                      size: 18,
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
                const Icon(
                  Icons.star,
                  color: ColorManager.yellowColor,
                  size: 14,
                ),
                SizedBox(width: 4.w),
                Text(rating.toString(), style: const TextStyle(fontSize: 12)),
              ],
            ),

            SizedBox(height: 4.h),

            /// PRICE ROW
            Row(
              children: [
                Text(
                  price,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                if (oldPrice != null) ...[
                  SizedBox(width: 6.w),
                  Text(
                    oldPrice!,
                    style: const TextStyle(
                      color: Colors.grey,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                ],
                const Spacer(),
                const Icon(Icons.shopping_cart_outlined, size: 18),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
