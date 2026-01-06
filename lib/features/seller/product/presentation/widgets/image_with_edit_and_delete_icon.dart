import 'package:flutter/material.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/features/seller/product/data/models/product_seller_model.dart';
import 'package:homesta/features/seller/product/presentation/views/product_form_screen.dart';

class ImageWithAddAndDeleteIcon extends StatelessWidget {
  const ImageWithAddAndDeleteIcon({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 125,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xFFF3F3F3),
            borderRadius: BorderRadius.circular(10),
          ),
          margin: EdgeInsets.only(left: 8, right: 8, bottom: 8, top: 16),
          child: Image.asset(product.image, fit: BoxFit.contain),
        ),
        Positioned(
          top: 25,
          right: 15,
          child: GestureDetector(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.delete_outline,
                color: ColorManager.redColor,
                size: 18,
              ),
            ),
          ),
        ),
        Positioned(
          top: 60,
          right: 15,
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductFormScreen(product: product),
                ),
              );
            },
            child: Container(
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.edit_outlined,
                color: ColorManager.primaryColor,
                size: 18,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
