import 'package:dartz/dartz.dart';
import 'package:homesta/core/error/error_model.dart';
import 'package:homesta/features/order/data/models/payment_response/payment_response.dart';

abstract class OrderRepo {
  Future<Either<ErrorModel, int>> addShipping(
    Map<String, dynamic> shippingData,
  );
  Future<Either<ErrorModel, PaymentResponse>> makePayment({
    required int orderId,
    required String paymentMethod,
  });
}
