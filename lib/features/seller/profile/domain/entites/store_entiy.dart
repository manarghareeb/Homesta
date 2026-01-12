class StoreEntity {
  final int storeId;
  final String name;
  final String phone;
  final String? email;
  final String? address;
  final String? workingHours;
  final bool hasWhatsapp;
  final bool hasSms;
  final String? sellerId;
  final String? sellerName;


   StoreEntity({
    required this.storeId,
    required this.name,
    required this.phone,
    this.email,
    this.address,
    this.workingHours,
    required this.hasWhatsapp,
    required this.hasSms,
    this.sellerId,
    this.sellerName,

  });
}
