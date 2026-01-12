
import 'package:homesta/features/seller/profile/domain/entites/store_entiy.dart';

class StoreModel extends StoreEntity {
  const StoreModel({
    required super.storeId,
    required super.name,
    required super.phone,
    super.email,
    super.address,
    super.workingHours,
    required super.hasWhatsapp,
    required super.hasSms,
    super.sellerId,
    super.sellerName,
    required super.totalProducts,
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
    );
  }
}
