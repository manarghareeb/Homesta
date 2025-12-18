import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:homesta/core/routing/app_router.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/theming/styles.dart';

class ProductPriceAndCartSection extends StatelessWidget {
  final double price;
  final double discountedPrice;
  final int discountPercent;

  const ProductPriceAndCartSection({
    super.key,
    required this.price,
    required this.discountedPrice,
    required this.discountPercent,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (discountPercent > 0)
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '\$$discountedPrice ',
                style: TextStyles.font14ThirdColorW400,
              ),
              Text(
                '\$$price',
                style: TextStyles.font14GreyColorW400
                    .copyWith(decoration: TextDecoration.lineThrough),
              ),
            ],
          )
        else
          Text(
            '\$${price.toStringAsFixed(2)}',
            style: TextStyles.font14ThirdColorW400,
          ),
        GestureDetector(
          onTap: () {
            GoRouter.of(context).push(AppRouter.cartScreen);
          },
          child: Icon(
            Icons.shopping_cart_outlined,
            size: 20.sp,
            color: ColorManager.primaryColor,
          ),
        ),
      ],
    );
  }
}
