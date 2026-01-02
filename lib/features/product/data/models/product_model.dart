import 'package:homesta/core/api/api_keys.dart';
import 'package:homesta/features/product/domain/entities/product_entitty.dart';

class ProductModel extends ProductEntity {
  const ProductModel({
    required super.productId,
    required super.name,
    required super.description,
    required super.colors,
    required super.price,
    required super.rating,
    required super.quantity,
    required super.discount,
    required super.deliveryTime,
    required super.subCategoryId,
    required super.categoryId,
    required super.storeId,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
productId: json[ApiKeys.productId],
      name: json[ApiKeys.name],
      description: json[ApiKeys.description],
      colors: 
        json[ApiKeys.colors],
      
      price: (json[ApiKeys.price] as num).toDouble(),
      rating: json[ApiKeys.rating],
      quantity: json[ApiKeys.quantity],
      discount: json[ApiKeys.discount],
      deliveryTime: json[ApiKeys.deliveryTime],
      subCategoryId: json[ApiKeys.subCategoryId],
      categoryId: json[ApiKeys.categoryId],
      storeId: json[ApiKeys.storeId],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      ApiKeys.name: name,
      ApiKeys.description: description,
      ApiKeys.colors: colors.join(','),
      ApiKeys.price: price,
      ApiKeys.rating: rating,
      ApiKeys.quantity: quantity,
      ApiKeys.discount: discount,
      ApiKeys.deliveryTime: deliveryTime,
      ApiKeys.subCategoryId: subCategoryId,
      ApiKeys.categoryId: categoryId,
      ApiKeys.storeId: storeId,
    };
  }
}
