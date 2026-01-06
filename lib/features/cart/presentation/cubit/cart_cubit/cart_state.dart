import 'package:homesta/features/cart/data/models/cart_model/cart_model.dart';

class CartState {}

class CartInitial extends CartState {}

class CartLoading extends CartState {}

class CartSuccess extends CartState {
  final CartModel message;
  CartSuccess(this.message);
}

class CartFailure extends CartState {
  final String error;
  CartFailure(this.error);
}
