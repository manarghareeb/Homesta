import '../../domain/entites/store_entiy.dart';

class SimpleStoreModel extends StoreEntity {
  SimpleStoreModel({
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
  });

  factory SimpleStoreModel.fromJson(Map<String, dynamic> json) {
    return SimpleStoreModel(
      storeId: json['storeId'] ?? 0,
      name: json['name'] ?? '',
      phone: json['phone'] ?? '',
      email: json['email'] ?? '',
      address: json['address'] ?? '',
      workingHours: json['workingHours'] ?? '',
      hasWhatsapp: true,
      hasSms: true,
      sellerId: '',
      sellerName: '',
    );
  }
}
