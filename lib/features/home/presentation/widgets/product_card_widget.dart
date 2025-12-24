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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(12.w),
          decoration: BoxDecoration(
            color: const Color(0xffE0DFDF),
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: 150.h,
                    width: double.infinity,
                    child: Image.asset(imagePath, fit: BoxFit.contain),
                  ),

                  Positioned(top: 0, left: 0, child: _badge(discount)),

                  Positioned(
                    top: 0,
                    right: 0,
                    child: Column(
                      children: [
                        _iconCircle(Icons.favorite_border),
                        SizedBox(height: 4.h),
                        _iconCircle(Icons.compare_arrows),
                        SizedBox(height: 4.h),
                        _iconCircle(Icons.shopping_cart_outlined),
                      ],
                    ),
                  ),

                  if (showTimer)
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 6.h),
                        decoration: BoxDecoration(
                          color: ColorManager.primaryColor,
                          borderRadius: BorderRadius.circular(15.r),
                        ),
                        child: const Text(
                          '05     :    12    :    30    : 25 \n Days   Hours   Mins   Sec',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 11),
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),

        SizedBox(height: 8.h),

        const Text(
          'Chair',
          style: TextStyle(fontSize: 12, color: ColorManager.blackColor),
        ),

        SizedBox(height: 4.h),

        Row(
          children: [
            Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
            const Spacer(),
            const Icon(Icons.star, color: Colors.amber, size: 16),
            Text(rating.toString()),
          ],
        ),

        SizedBox(height: 6.h),

        Row(
          children: [
            Text(price, style: const TextStyle(fontWeight: FontWeight.bold)),
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
    );
  }

  Widget _badge(String text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: ColorManager.primaryColor,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white, fontSize: 11),
      ),
    );
  }

  Widget _iconCircle(IconData icon) {
    return Container(
      padding: EdgeInsets.all(2.w),
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: Icon(icon, size: 16),
    );
  }
}
