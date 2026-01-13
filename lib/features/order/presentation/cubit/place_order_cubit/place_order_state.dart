import 'package:homesta/features/order/data/models/place_order_response.dart';

abstract class PlaceOrderState {}

class PlaceOrderInitial extends PlaceOrderState {}

class PlaceOrderLoading extends PlaceOrderState {}

class PlaceOrderSuccess extends PlaceOrderState {
  final PlaceOrderResponse placeOrderResponse; 
  PlaceOrderSuccess(this.placeOrderResponse);
}

class PlaceOrderFailure extends PlaceOrderState {
  final String error;
  PlaceOrderFailure(this.error);
}