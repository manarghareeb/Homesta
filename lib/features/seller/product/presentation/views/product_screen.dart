import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/widgets/custom_app_bar_widget.dart';
import 'package:homesta/features/seller/product/data/models/product_seller_model.dart';
import 'package:homesta/features/seller/product/presentation/widgets/product_cart.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Product staticProduct = Product(
      name: "Modern Leather Sofa",
      category: "Furniture",
      description: "Luxurious 3-seater leather sofa",
      price: 1200.00,
      image: "assets/images/chair.png",
      stock: 12,
      colorName: "Beige",
      colorValue: Color(0xFFE6D5C3),
    );

    final List<Product> products = List.generate(6, (index) => staticProduct);
    return Scaffold(
      backgroundColor: ColorManager.soLightGreyColor,
      appBar: CustomAppBarWidget(
        text: 'Products',
        backgroundColor: ColorManager.soLightGreyColor,
      ),
      body: MasonryGridView.count(
        padding: const EdgeInsets.all(16),
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ProductCard(product: products[index]);
        },
      ),
    );
  }
}
