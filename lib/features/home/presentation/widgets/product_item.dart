import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:homesta/core/routing/app_router.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/features/product/domain/entities/product_entitty.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.productEntity});
  final ProductEntity productEntity;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
       context.push(AppRouter.productDetailsScreen,extra: productEntity);
      },
      child: SizedBox(
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
                        "assets/images/catrgories_image/bedroom.png",
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
      
                    /// Discount
                    Positioned(
                      top: 6,
                      left: 6,
                      child: _badge("${productEntity.discount}% Off"),
                    ),
      
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
                  ],
                ),
              ),
      
              SizedBox(height: 6.h),
      
              /// TITLE
              Text(
                productEntity.name,
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
                  Text(
                    productEntity.rating.toString(),
                    style: const TextStyle(fontSize: 12),
                  ),
                ],
              ),
      
              SizedBox(height: 4.h),
      
              /// PRICE
              Row(
                children: [
                  Text(
                    "${(productEntity.price * productEntity.discount) / 100} EGP",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 6.w),
                  Text(
                    productEntity.price.toString(),
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
