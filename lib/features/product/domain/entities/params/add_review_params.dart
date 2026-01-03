class AddReviewParams {
  final int productId;
  final String userId;
  final int storeId;
  final int rating;
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
