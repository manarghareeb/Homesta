import 'package:homesta/features/product/domain/entities/product_entitty.dart';

class StoreEntity {
  final int storeId;
  final String name;
  final String phone;
  final String email;
  final String address;
  final String workingHours;
  final bool? hasWhatsapp;
  final bool? hasSms;
  final String? sellerId;
  final String? sellerName;
  final int? totalProducts;
  final List<ProductEntity>? products;

  StoreEntity({
    required this.storeId,
    required this.name,
    required this.phone,
    required this.email,
    required this.address,
    required this.workingHours,
    this.hasWhatsapp,
    this.hasSms,
    this.sellerId,
    this.sellerName,
    this.totalProducts,
    this.products,
  });
}
