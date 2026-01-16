import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/core/theming/colors.dart';
import 'trending_sales_card.dart';

class TrendingSalesSection extends StatelessWidget {
  final String title;

  const TrendingSalesSection({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const Spacer(),
            TextButton(
              onPressed: () {},
              child: const Text(
                'More',
                style: TextStyle(fontSize: 15, color: ColorManager.greyColor),
              ),
            ),
          ],
        ),

        SizedBox(height: 12.h),

        SizedBox(
          height: 240.h,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: const [
              TrendingSalesCard(
                image: 'assets/images/chair.png',
                badgeText: '25% Off',
                title: 'Sofa Chair',
                rating: 4.9,
                price: '\$75',
                oldPrice: '\$100',
              ),
              SizedBox(width: 12),
              TrendingSalesCard(
                image: 'assets/images/Frame 2147227395.png',
                badgeText: 'Sale',
                title: 'Dinning Room',
                rating: 4.9,
                price: '\$150',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
