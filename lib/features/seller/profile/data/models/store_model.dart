

import 'package:homesta/features/seller/profile/domain/entites/store_entiy.dart';

class StoreModel extends StoreEntity {
  StoreModel({
    required super.name,
    required super.phone,
    required super.email,
    required super.address,
    required super.workingHours,
    required super.hasWhatsapp,
    required super.hasSms,
  });

  factory StoreModel.fromJson(Map<String, dynamic> json) {
    return StoreModel(
      name: json['name'],
      phone: json['phone'],
      email: json['email'],
      address: json['address'],
      workingHours: json['workingHours'],
      hasWhatsapp: json['hasWhatsapp'],
      hasSms: json['hasSms'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phone': phone,
      'email': email,
      'address': address,
      'workingHours': workingHours,
      'hasWhatsapp': hasWhatsapp,
      'hasSms': hasSms,
    };
  }
}
