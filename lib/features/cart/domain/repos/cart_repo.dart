import 'package:homesta/features/cart/data/models/add_item_to_cart_response.dart';
import 'package:homesta/features/cart/data/models/cart_model/cart_model.dart';

abstract class CartRepo {
  Future<AddItemToCartResponse> addItemToCart({
    required int productId,
    required int quantity,
    required int colorId,
  });
  Future<CartModel> getCart();
}
