import 'package:flutter/material.dart';
import 'package:homesta/core/theming/styles.dart';
import 'package:homesta/features/home/presentation/widgets/product_card_widget.dart';

class ExploreProduct extends StatelessWidget {
  const ExploreProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Explore Product", style: TextStyles.font16BlackRegular),
        SizedBox(
          height: 500,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(
                  left: 16.0,
                  right: 16.0,
                  bottom: 16.0,
                ),
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
