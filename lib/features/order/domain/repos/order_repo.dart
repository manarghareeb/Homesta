import 'package:dartz/dartz.dart';
import 'package:homesta/core/error/error_model.dart';
import 'package:homesta/features/order/data/models/order_details_response/order_details.dart';
import 'package:homesta/features/order/data/models/payment_response/payment_response.dart';
import 'package:homesta/features/order/data/models/place_order_response.dart';

abstract class OrderRepo {
  Future<Either<ErrorModel, int>> addShipping(
    Map<String, dynamic> shippingData,
  );
  Future<Either<ErrorModel, PaymentResponse>> makePayment({
    required int orderId,
    required String paymentMethod,
  });
  Future<Either<ErrorModel, PlaceOrderResponse>> makePlaceOrder({
    required String userId,
  });
  Future<Either<ErrorModel, OrderDetails>> getOrderDetails(int orderId);
}
