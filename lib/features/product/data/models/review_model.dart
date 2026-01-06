import 'package:homesta/core/api/api_keys.dart';
import 'package:homesta/features/product/domain/entities/review_entity.dart';

class ReviewModel extends ReviewEntity {
  const ReviewModel({
    required super.reviewId,
    required super.comment,
    required super.rating,
    required super.reviewDate,
    required super.userName,
    required super.productName,
    required super.storeName,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      reviewId: json[ApiKeys.reviewId],
      comment: json[ApiKeys.comment],
      rating: json[ApiKeys.rating],
      reviewDate: DateTime.parse(json[ApiKeys.reviewDate]),
      userName: json[ApiKeys.userName],
      productName: json[ApiKeys.productName],
      storeName: json[ApiKeys.storeName],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      ApiKeys.reviewId: reviewId,
      ApiKeys.comment: comment,
      ApiKeys.rating: rating,
      ApiKeys.reviewDate: reviewDate.toIso8601String(),
      ApiKeys.userName: userName,
      ApiKeys.productName: productName,
      ApiKeys.storeName: storeName,
    };
  }
}
