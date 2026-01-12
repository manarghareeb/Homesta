import 'package:homesta/core/api/api_keys.dart';

class AddProductParams {

  final String name;
  final String description;
  final List<String> colors;
  final int price;
  final int rating;
  final int quantity;
  final int discount;
  final int subCategoryId;
  final int categoryId;
  final int storeId;
  final int deliveryTime;

  AddProductParams({

    required this.name,
    required this.description,
    required this.colors,
    required this.rating,
    required this.price,
    required this.quantity,
    required this.discount,
    required this.subCategoryId,
    required this.categoryId,
    required this.storeId,
    required this.deliveryTime,
  });

  Map<String, dynamic> toJson() {
    return {
    ApiKeys.name: name,
    ApiKeys.description: description,
    ApiKeys.colors: colors,
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
