import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/features/shop/presentation/widgets/product_card_widget.dart';

class ProductsGridWidget extends StatelessWidget {
  const ProductsGridWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
      physics: const BouncingScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        mainAxisExtent: 360, // ✅ أفضل ارتفاع للكرت
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final item = products[index];
        return ProductCard(
          title: item['title'],
          image: item['image'],
          price: item['price'],
          oldPrice: item['oldPrice'],
          rating: item['rating'],
        );
      },
    );
  }
}

/// dummy data
final List<Map<String, dynamic>> products = [
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
