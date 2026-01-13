class UserOrdersResponse {
  final int orderId;
  final String orderDate;
  final String orderDateFormatted;
  final String status;
  final double totalPrice;
  final String paymentMethod;
  final String phone;
  final String address;
  final String city;
  final String country;
  final String zipCode;
  final String firstName;
  final String lastName;
  final String email;

  UserOrdersResponse({
    required this.orderId,
    required this.orderDate,
    required this.orderDateFormatted,
    required this.status,
    required this.totalPrice,
    required this.paymentMethod,
    required this.phone,
    required this.address,
    required this.city,
    required this.country,
    required this.zipCode,
    required this.firstName,
    required this.lastName,
    required this.email,
  });

  factory UserOrdersResponse.fromJson(Map<String, dynamic> json) {
    return UserOrdersResponse(
      orderId: json['orderId'] ?? 0,
      orderDate: json['orderDate'] ?? '',
      orderDateFormatted: json['orderDateFormatted'] ?? '',
      status: json['status'] ?? '',
      totalPrice: (json['totalPrice'] ?? 0).toDouble(),
      paymentMethod: json['paymentMethod'] ?? '',
      phone: json['phone'] ?? '',
      address: json['address'] ?? '',
      city: json['city'] ?? '',
      country: json['country'] ?? '',
      zipCode: json['zipCode'] ?? '',
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
      email: json['email'] ?? '',
    );
  }
}
