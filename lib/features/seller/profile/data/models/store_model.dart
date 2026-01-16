// import 'package:homesta/features/product/data/models/product_model.dart';
// import 'package:homesta/features/seller/profile/domain/entites/store_entiy.dart';

// class StoreModel extends StoreEntity {
//   StoreModel({
//     required super.storeId,
//     required super.name,
//     required super.phone,
//     required super.email,
//     required super.address,
//     required super.workingHours,
//     required super.hasWhatsapp,
//     required super.hasSms,
//     required super.sellerId,
//     required super.sellerName,
//     super.totalProducts,
//     super.products,
//   });

//   factory StoreModel.fromJson(Map<String, dynamic> json) {
//     return StoreModel(
//       storeId: json['storeId'] ?? 0,
//       name: json['name'] ?? '',
//       phone: json['phone'] ?? '',
//       email: json['email'] ?? '',
//       address: json['address'] ?? '',
//       workingHours: json['workingHours'] ?? '',
//       hasWhatsapp: json['hasWhatsapp'] ?? false,   // default false
//       hasSms: json['hasSms'] ?? false,             // default false
//       sellerId: json['sellerId'] ?? 0,
//       sellerName: json['sellerName'] ?? '',
//       totalProducts: json['totalProducts'] ?? 0,
//       products: json['products'] != null
//           ? (json['products'] as List)
//           .map((e) => ProductModel.fromJson(e))
//           .toList()
//           : [],
//     );
//   }
// }
import 'package:homesta/features/product/data/models/product_model.dart';
import 'package:homesta/features/seller/profile/domain/entites/store_entiy.dart';

class StoreModel extends StoreEntity {
  StoreModel({
    required super.storeId,
    required super.name,
    required super.phone,
    required super.email,
    required super.address,
    required super.workingHours,
    required super.hasWhatsapp,
    required super.hasSms,
    required super.sellerId,
    required super.sellerName,
    super.totalProducts,
    super.products,
  });

  factory StoreModel.fromJson(Map<String, dynamic> json) {
    return StoreModel(
      storeId: json['storeId'],
      name: json['name'],
      phone: json['phone'],
      email: json['email'],
      address: json['address'],
      workingHours: json['workingHours'],
      hasWhatsapp: json['hasWhatsapp'],
      hasSms: json['hasSms'],
      sellerId: json['sellerId'],
      sellerName: json['sellerName'],
      totalProducts: json['totalProducts'],
      products: json['products'] != null
          ? (json['products'] as List)
              .map((e) => ProductModel.fromJson(e))
              .toList()
          : null,
    );
  }
}