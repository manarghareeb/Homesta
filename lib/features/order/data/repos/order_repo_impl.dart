import 'package:dartz/dartz.dart';
import 'package:homesta/core/api/api_consumer.dart';
import 'package:homesta/core/api/api_keys.dart';
import 'package:homesta/core/api/end_ponits.dart';
import 'package:homesta/core/error/error_model.dart';
import 'package:homesta/core/error/expections.dart';
import 'package:homesta/features/order/data/models/order_details_response/order_details.dart';
import 'package:homesta/features/order/data/models/payment_response/payment_response.dart';
import 'package:homesta/features/order/data/models/place_order_response.dart';
import 'package:homesta/features/order/data/models/user_orders_response.dart';
import 'package:homesta/features/order/domain/repos/order_repo.dart';

class OrderRepoImpl implements OrderRepo {
  final ApiConsumer apiConsumer;

  OrderRepoImpl({required this.apiConsumer});

  @override
  Future<Either<ErrorModel, int>> addShipping(
    Map<String, dynamic> shippingData,
  ) async {
    try {
      final response = await apiConsumer.post(
        EndPoint.shipping,
        data: shippingData,
      );
      if (response is int) {
        return right(response);
      } else if (response is Map<String, dynamic> && response['data'] is int) {
        return right(response['data']);
      } else {
        return left(
          ErrorModel(
            errorMessage: 'Invalid response format from server: $response',
          ),
        );
      }
    } on ServerException catch (e) {
      return left(e.errModel);
    }
  }

  @override
  Future<Either<ErrorModel, PaymentResponse>> makePayment({
    required int orderId,
    required String paymentMethod,
  }) async {
    try {
      final response = await apiConsumer.post(
        EndPoint.payment,
        data: {"orderId": orderId, "paymentMethod": paymentMethod},
      );

      if (response is Map<String, dynamic>) {
        final result = PaymentResponse.fromJson(response);
        return right(result);
      } else {
        return left(
          ErrorModel(
            errorMessage: 'Invalid response format from server: $response',
          ),
        );
      }
    } on ServerException catch (e) {
      return left(e.errModel);
    }
  }

  @override
  Future<Either<ErrorModel, PlaceOrderResponse>> makePlaceOrder({
    required String userId,
  }) async {
    try {
      final response = await apiConsumer.post(
        EndPoint.createPlaceOrder,
        data: {ApiKeys.userId: userId},
      );

      if (response is Map<String, dynamic>) {
        final result = PlaceOrderResponse.fromJson(response);
        return right(result);
      } else {
        return left(
          ErrorModel(
            errorMessage: 'Invalid response format from server: $response',
          ),
        );
      }
    } on ServerException catch (e) {
      return left(e.errModel);
    }
  }

  @override
  Future<Either<ErrorModel, OrderDetails>> getOrderDetails(int orderId) async {
    try {
      final response = await apiConsumer.get('${EndPoint.orderDetails}?orderId=$orderId');
      if (response is Map<String, dynamic>) {
        final order = OrderDetails.fromJson(response);
        return right(order);
      } else {
        return left(
          ErrorModel(
            errorMessage: 'Invalid response format from server: $response',
          ),
        );
      }
    } on ServerException catch (e) {
      return left(e.errModel);
    }
  }

  @override
  Future<Either<ErrorModel, List<UserOrdersResponse>>> getUserOrders() async {
    try {
      final response = await apiConsumer.get(EndPoint.userOrders);

      if (response is List) {
        final orders = response
            .map((e) => UserOrdersResponse.fromJson(e as Map<String, dynamic>))
            .toList();
        return right(orders);
      } else {
        return left(
          ErrorModel(
            errorMessage: 'Invalid response format from server: $response',
          ),
        );
      }
    } on ServerException catch (e) {
      return left(e.errModel);
    }
  }
}
