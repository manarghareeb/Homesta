class CreateStoreParams {
  final String name;
  final String phone;
  final String email;
  final String address;
  final String workingHours;
  final bool hasWhatsapp;
  final bool hasSms;

  CreateStoreParams({
    required this.name,
    required this.phone,
    required this.email,
    required this.address,
    required this.workingHours,
    required this.hasWhatsapp,
    required this.hasSms,
  });
    toJson(){
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
