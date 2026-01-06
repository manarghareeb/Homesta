import 'package:homesta/features/cart/data/models/add_item_to_cart_response.dart';

abstract class CartRepo {
  Future<AddItemToCartResponse> addItemToCart(
    int productId,
    int quantity,
    int colorId,
  );
}
