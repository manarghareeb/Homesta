import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/features/cart/presentation/widgets/product_image_with_badge_section.dart';
import 'package:homesta/features/cart/presentation/widgets/product_overlay_actions.dart';
import 'package:homesta/features/cart/presentation/widgets/product_price_and_cart_section.dart';
import 'package:homesta/features/cart/presentation/widgets/product_title_and_rating_section.dart';
import 'package:homesta/features/product/domain/entities/product_entitty.dart';

class ProductItem extends StatefulWidget {
  final String name;
  final double price;
  final int discountPercent;
  final String image;
  final double rating;

  const ProductItem({
    super.key,
    required this.name,
    required this.price,
    required this.discountPercent,
    required this.image,
    required this.rating,
    required ProductEntity productEntity,
  });

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Offset> slideAnimation;
  late Animation<double> opacityAnimation;
  bool isVisible = false;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    slideAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.easeOutCubic));
    opacityAnimation = Tween<double>(begin: 0, end: 1).animate(controller);
  }

  void toggleOverlay() {
    setState(() {
      isVisible = !isVisible;
      if (isVisible) {
        controller.forward();
      } else {
        controller.reverse();
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double discountedPrice =
        widget.price - (widget.price * widget.discountPercent / 100);

    return GestureDetector(
      onTap: toggleOverlay,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: ColorManager.soLightGreyColor,
              borderRadius: BorderRadius.circular(15.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProductImageWithBadgeSection(
                  image: widget.image,
                  discountPercent: widget.discountPercent,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 8.w,
                    vertical: 16.h,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ProductTitleAndRatingSection(
                        name: widget.name,
                        rating: widget.rating,
                      ),
                      SizedBox(height: 8.h),
                      ProductPriceAndCartSection(
                        price: widget.price,
                        discountedPrice: discountedPrice,
                        discountPercent: widget.discountPercent,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          if (isVisible)
            SlideTransition(
              position: slideAnimation,
              child: FadeTransition(
                opacity: opacityAnimation,
                child: ProductOverlayActionsSection(
                  message: 'Out of stock',
                  onSimilarPressed: () {},
                  onDeletePressed: () {},
                ),
              ),
            ),
        ],
      ),
    );
  }
}
