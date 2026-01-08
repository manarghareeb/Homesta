import 'package:dio/dio.dart';
import 'package:homesta/core/api/api_consumer.dart';
import 'package:homesta/core/api/api_keys.dart';
import 'package:homesta/core/api/end_ponits.dart';
import 'package:homesta/features/cart/data/models/add_item_to_cart_response.dart';
import 'package:homesta/features/cart/data/models/cart_model/cart_model.dart';
import 'package:homesta/features/cart/domain/repos/cart_repo.dart';

class CartRepoImpl implements CartRepo {
  final ApiConsumer apiConsumer;
  CartRepoImpl({required this.apiConsumer});

  @override
  Future<AddItemToCartResponse> addItemToCart({
    required int productId,
    required int quantity,
    required int colorId,
  }) async {
    try {
      final response = await apiConsumer.post(
        EndPoint.addCart,
        data: {
          ApiKeys.productId: productId,
          ApiKeys.quantity: quantity,
          ApiKeys.colorId: colorId,
        },
      );
      if (response != null && response is Map<String, dynamic>) {
        return AddItemToCartResponse.fromJson(response);
      } else {
        print(response.headers);
        print(response.statusCode);

        throw Exception('Invalid or empty response from server');
      }
      //return AddItemToCartResponse.fromJson(response);
    } on DioException catch (e) {
      final serverMessage =
          e.response?.data is Map<String, dynamic>
              ? e.response?.data['message']
              : null;
      throw Exception(serverMessage ?? 'Failed to add product to cart');
    } catch (e) {
      throw Exception(e.toString());
      /*if (e is DioException) {
        //handleDioExceptions(e);
        throw Exception(
          e.response?.data['message'] ?? 'Failed to add product to cart',
        );
      }
      rethrow;*/
    }
  }

  Future<CartModel> getCart() async {
    try {
      final response = await apiConsumer.get(EndPoint.getCart);
      return CartModel.fromJson(response);
    } catch (e) {
      if (e is DioException) {
        throw Exception(e.response?.data['message'] ?? 'Failed to fetch cart');
      }
      rethrow;
    }
  }
}
