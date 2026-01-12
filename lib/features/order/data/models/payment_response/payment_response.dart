import 'package:homesta/features/order/data/models/payment_response/order_data.dart';

class PaymentResponse {
  final String message;
  final OrderData success;

  PaymentResponse({required this.message, required this.success});

  factory PaymentResponse.fromJson(Map<String, dynamic> json) => PaymentResponse(
        message: json['message'] as String,
        success: OrderData.fromJson(json['success'] as Map<String, dynamic>),
      );
}