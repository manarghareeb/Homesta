import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    return Container(
      width: 170.w,
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 8),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(14.r),
                child: Image.asset(
                  image,
                  height: 110.h,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),

              Positioned(
                top: 8,
                left: 8,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 4.h,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xff2F5D62),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Text(
                    badgeText,
                    style: const TextStyle(color: Colors.white, fontSize: 11),
                  ),
                ),
              ),

              Positioned(
                top: 8,
                right: 8,
                child: const Icon(Icons.favorite_border, color: Colors.red),
              ),
            ],
          ),

          SizedBox(height: 8.h),

          Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),

          SizedBox(height: 4.h),
          Row(
            children: [
              const Icon(Icons.star, color: Colors.amber, size: 16),
              SizedBox(width: 4.w),
              Text(rating.toString()),
            ],
          ),

          SizedBox(height: 6.h),
          Row(
            children: [
              Text(price, style: const TextStyle(fontWeight: FontWeight.bold)),
              if (oldPrice != null) ...[
                SizedBox(width: 6.w),
                Text(
                  oldPrice!,
                  style: const TextStyle(
                    decoration: TextDecoration.lineThrough,
                    color: Colors.grey,
                  ),
                ),
              ],
              const Spacer(),
              const Icon(Icons.shopping_cart_outlined, size: 18),
            ],
          ),
        ],
      ),
    );
  }
}
