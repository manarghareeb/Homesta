import 'package:homesta/features/order/data/models/payment_response/order_item.dart';

class OrderDetails {
  final int orderId;
  final String orderDate;
  final String orderDateFormatted;
  final String status;
  final String paymentMethod;
  final String address;
  final String city;
  final String country;
  final String phone;
  final String zipCode;
  final String firstName;
  final String lastName;
  final String email;
  final List<OrderItem> items;
  final double orderSubtotal;
  final double orderDiscount;
  final double orderTotal;
  final double databaseTotal;

  OrderDetails({
    required this.orderId,
    required this.orderDate,
    required this.orderDateFormatted,
    required this.status,
    required this.paymentMethod,
    required this.address,
    required this.city,
    required this.country,
    required this.phone,
    required this.zipCode,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.items,
    required this.orderSubtotal,
    required this.orderDiscount,
    required this.orderTotal,
    required this.databaseTotal,
  });

  factory OrderDetails.fromJson(Map<String, dynamic> json) {
    return OrderDetails(
      orderId: json['orderId'],
      orderDate: json['orderDate'],
      orderDateFormatted: json['orderDateFormatted'],
      status: json['status'],
      paymentMethod: json['paymentMethod'],
      address: json['address'],
      city: json['city'],
      country: json['country'],
      phone: json['phone'],
      zipCode: json['zipCode'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      items: (json['items'] as List)
          .map((e) => OrderItem.fromJson(e))
          .toList(),
      orderSubtotal: (json['orderSubtotal'] as num).toDouble(),
      orderDiscount: (json['orderDiscount'] as num).toDouble(),
      orderTotal: (json['orderTotal'] as num).toDouble(),
      databaseTotal: (json['databaseTotal'] as num).toDouble(),
    );
  }
}
