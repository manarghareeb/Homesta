import 'package:flutter/material.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/theming/styles.dart';
import 'package:homesta/features/home/presentation/widgets/product_card_widget.dart';

class ExploreProduct extends StatelessWidget {
  const ExploreProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Explore Related Product", style: TextStyles.font16BlackW500.copyWith(color: ColorManager.primaryColor)),
        SizedBox(
          height: 260,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Container(
                  width: 170,
                  height: 250,
                  child: ProductCardWidget(
                    imagePath: 'assets/images/chair.png',
                    title: 'Wooden Sofa Chair',
                    price: '\$80.00',
                    oldPrice: '\$160.00',
                    discount: '50% Off',
                    rating: 4.9,
                    showTimer: false,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
