class PlaceOrderResponse {
  final int orderId;
  final String message;

  PlaceOrderResponse({required this.orderId, required this.message});

  factory PlaceOrderResponse.fromJson(Map<String, dynamic> json) {
    return PlaceOrderResponse(
      orderId: json['orderId'] as int,
      message: json['message'] as String,
    );
  }
}
