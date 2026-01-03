class AddReviewParams {
  final String productId;
  final String userId;
  final String storeId;
  final double rating;
  final String comment;

  AddReviewParams({
    required this.productId,
    required this.userId,
    required this.storeId,
    required this.rating,
    required this.comment,
  });

  Map<String, dynamic> toJson() {
    return {
      "productId": productId,
      "userId": userId,
      "storeId": storeId,
      "rating": rating,
      "comment": comment,
    };
  }
}
