import 'package:homesta/features/order/data/models/payment_response/order_item.dart';

class OrderData {
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

  OrderData({
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

  factory OrderData.fromJson(Map<String, dynamic> json) => OrderData(
        orderId: json['orderId'] as int,
        orderDate: json['orderDate'] as String,
        orderDateFormatted: json['orderDateFormatted'] as String,
        status: json['status'] as String,
        paymentMethod: json['paymentMethod'] as String,
        address: json['address'] as String,
        city: json['city'] as String,
        country: json['country'] as String,
        phone: json['phone'] as String,
        zipCode: json['zipCode'] as String,
        firstName: json['firstName'] as String,
        lastName: json['lastName'] as String,
        email: json['email'] as String,
        items: (json['items'] as List<dynamic>)
            .map((e) => OrderItem.fromJson(e as Map<String, dynamic>))
            .toList(),
        orderSubtotal: (json['orderSubtotal'] as num).toDouble(),
        orderDiscount: (json['orderDiscount'] as num).toDouble(),
        orderTotal: (json['orderTotal'] as num).toDouble(),
        databaseTotal: (json['databaseTotal'] as num).toDouble(),
      );
}
