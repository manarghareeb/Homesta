class AddItemToCartResponse {
  final bool success;
  final String message;
  final int cartItemId;
  final int totalItems;

  AddItemToCartResponse({
    required this.success,
    required this.message,
    required this.cartItemId,
    required this.totalItems,
  });

  factory AddItemToCartResponse.fromJson(Map<String, dynamic> json) {
    return AddItemToCartResponse(
      success: json['success'] ?? false,
      message: json['message'] ?? '',
      cartItemId: json['cartItemId'] ?? 0,
      totalItems: json['totalItems'] ?? 0,
    );
  }
}
