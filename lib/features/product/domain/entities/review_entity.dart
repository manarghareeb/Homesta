class ReviewEntity {
  final int reviewId;
  final String comment;
  final int rating;
  final DateTime reviewDate;
  final String userName;
  final String productName;
  final String storeName;

  const ReviewEntity({
    required this.reviewId,
    required this.comment,
    required this.rating,
    required this.reviewDate,
    required this.userName,
    required this.productName,
    required this.storeName,
  });
}
