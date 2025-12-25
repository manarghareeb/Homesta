import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/features/shop/presentation/widgets/product_card_widget.dart';

class ProductsGridWidget extends StatelessWidget {
  const ProductsGridWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 6,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16.h,
        crossAxisSpacing: 16.w,
        childAspectRatio: 0.75,
      ),
      itemBuilder: (context, index) {
        return ProductCard(
          title: _products[index]['title'],
          image: _products[index]['image'],
          price: _products[index]['price'],
          oldPrice: _products[index]['oldPrice'],
          rating: _products[index]['rating'],
        );
      },
    );
  }
}

/// dummy data
final List<Map<String, dynamic>> _products = [
  {
    'title': 'Toaster',
    'image': 'assets/images/chair.png',
    'price': 54.00,
    'oldPrice': 60.00,
    'rating': 4.9,
  },
  {
    'title': 'Air Conditioner',
    'image': 'assets/images/chair.png',
    'price': 54.00,
    'oldPrice': 60.00,
    'rating': 4.9,
  },
  {
    'title': 'Dishwasher',
    'image': 'assets/images/chair.png',
    'price': 54.00,
    'oldPrice': 60.00,
    'rating': 4.9,
  },
  {
    'title': 'Coffee Machine',
    'image': 'assets/images/chair.png',
    'price': 54.00,
    'oldPrice': 60.00,
    'rating': 4.9,
  },
  {
    'title': 'Sofa',
    'image': 'assets/images/chair.png',
    'price': 54.00,
    'oldPrice': 60.00,
    'rating': 4.9,
  },
  {
    'title': 'Cookware Set',
    'image': 'assets/images/chair.png',
    'price': 54.00,
    'oldPrice': 60.00,
    'rating': 4.9,
  },
];
