import 'package:flutter/material.dart';
import 'package:homesta/core/widgets/custom_product_image.dart';
import 'package:homesta/features/product/domain/entities/product_entitty.dart';

class ImageWithAddAndDeleteIcon extends StatelessWidget {
  const ImageWithAddAndDeleteIcon({super.key, required this.productEntity, });

 final ProductEntity productEntity;


  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          CustomProductImage(id: productEntity.productId,),
          // Positioned(
          //   top: 25,
          //   right: 15,
          //   child: GestureDetector(
          //     onTap: () {},
          //     child: Container(
          //       padding: EdgeInsets.all(4),
          //       decoration: BoxDecoration(
          //         color: Colors.white,
          //         shape: BoxShape.circle,
          //       ),
          //       child: Icon(
          //         Icons.delete_outline,
          //         color: ColorManager.redColor,
          //         size: 18,
          //       ),
          //     ),
          //   ),
          // ),
          // Positioned(
          //   top: 60,
          //   right: 15,
          //   child: GestureDetector(
          //     onTap: () {
          //       // Navigator.push(
          //       //   context,
          //       //   MaterialPageRoute(
          //       //     builder: (context) => ProductFormScreen(product: product),
          //       //   ),
          //       // );
          //     },
          //     child: Container(
          //       padding: EdgeInsets.all(4),
          //       decoration: BoxDecoration(
          //         color: Colors.white,
          //         shape: BoxShape.circle,
          //       ),
          //       child: Icon(
          //         Icons.edit_outlined,
          //         color: ColorManager.primaryColor,
          //         size: 18,
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
