

import 'package:homesta/features/seller/product/domain/entitiy/product_image_entity.dart';

class ProductImageModel extends ProductImageEntity {
  ProductImageModel({
    required super.productImageId,
    required super.imageUrl,
  });

  factory ProductImageModel.fromJson(Map<String, dynamic> json) {
    return ProductImageModel(
      productImageId: json['productImageId'],
      imageUrl: json['imageUrl'],
    );
  }
}
