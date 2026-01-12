
abstract class ShippingState{
  const ShippingState();
}

class ShippingInitial extends ShippingState {}

class ShippingLoading extends ShippingState {}

class ShippingSuccess extends ShippingState {
  final int response;
  const ShippingSuccess(this.response);
}

class ShippingFailure extends ShippingState {
  final String error;
  const ShippingFailure(this.error);
}
