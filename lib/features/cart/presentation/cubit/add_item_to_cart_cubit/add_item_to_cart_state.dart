import 'package:homesta/features/cart/data/models/add_item_to_cart_response.dart';

abstract class AddItemToCartState {}

class AddItemToCartInitial extends AddItemToCartState {}

class AddItemToCartLoading extends AddItemToCartState {}

class AddItemToCartSuccess extends AddItemToCartState {
  final AddItemToCartResponse response;
  AddItemToCartSuccess(this.response);
}

class AddItemToCartFailure extends AddItemToCartState {
  final String error;
  AddItemToCartFailure(this.error);
}
