class AddReviewParams {
  final int productId;
  final String userId;
  final int storeId;
  final int rating;
  final String comment;
  final DateTime reviewDate;

  AddReviewParams({
    required this.productId,
    required this.userId,
    required this.storeId,
    required this.rating,
    required this.comment, 
    required this.reviewDate,
  });

  Map<String, dynamic> toJson() {
    return {
      "productId": productId,
      "userId": userId,
      "storeId": storeId,
      "rating": rating,
      "comment": comment,
      "reviewDate": reviewDate.toIso8601String(),
    };
  }
}
