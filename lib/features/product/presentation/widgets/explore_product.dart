import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/theming/styles.dart';
import 'package:homesta/features/home/presentation/widgets/product_card_widget.dart';

class ExploreProduct extends StatelessWidget {
  const ExploreProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Explore Related Product",
          style: TextStyles.font16BlackW500.copyWith(
            color: ColorManager.primaryColor,
          ),
        ),

        SizedBox(height: 12.h),

        SizedBox(
          height: 350.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            itemCount: 10,
            separatorBuilder: (_, __) => SizedBox(width: 10.w),
            itemBuilder: (context, index) {
              return SizedBox(
                width: 200.w,
                child: ProductCardWidget(
                  imagePath: 'assets/images/chair.png',
                  title: 'Wooden Sofa Chair',
                  price: '\$80.00',
                  oldPrice: '\$160.00',
                  discount: '50% Off',
                  rating: 4.9,
                  showTimer: false,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
