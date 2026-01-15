class PlaceOrderResponse {
  final int orderId;
  final String message;

  PlaceOrderResponse({required this.orderId, required this.message});

  factory PlaceOrderResponse.fromJson(Map<String, dynamic> json) {
    final orderId = json['orderId'];
    if (orderId == null) {
      throw Exception("orderId is null in PlaceOrderResponse");
    }
    return PlaceOrderResponse(
      orderId: orderId as int,
      message: json['message'] as String,
    );
  }
}
