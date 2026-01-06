import 'package:dio/dio.dart';
import 'package:homesta/core/api/api_consumer.dart';
import 'package:homesta/core/api/api_keys.dart';
import 'package:homesta/core/api/end_ponits.dart';
import 'package:homesta/features/cart/data/models/add_item_to_cart_response.dart';
import 'package:homesta/features/cart/domain/repos/cart_repo.dart';

class CartRepoImpl implements CartRepo {
  final ApiConsumer apiConsumer;
  CartRepoImpl({required this.apiConsumer});

  @override
  Future<AddItemToCartResponse> addItemToCart(
    int productId,
    int quantity,
    int colorId,
  ) async {
    try {
      final response = await apiConsumer.post(
        EndPoint.addCart,
        data: {
          ApiKeys.productId: productId,
          ApiKeys.quantity: quantity,
          ApiKeys.colorId: colorId,
        },
      );
      return AddItemToCartResponse.fromJson(response);
    } catch (e) {
      if (e is DioException) {
        //handleDioExceptions(e);
        throw Exception(
          e.response?.data['message'] ?? 'Failed to add product to cart',
        );
      }
      rethrow;
    }
  }
}
