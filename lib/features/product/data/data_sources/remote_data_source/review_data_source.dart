
import 'package:homesta/core/api/api_consumer.dart';
import 'package:homesta/core/api/end_ponits.dart';
import 'package:homesta/features/product/data/models/review_model.dart';
import 'package:homesta/features/product/domain/entities/params/add_review_params.dart';

abstract class ReviewProductDataSource {
  Future<List<ReviewModel>> getProductReviews(int productId);
  Future<void> addReview(AddReviewParams params);


}

class ReviewProductDataSourceImp implements ReviewProductDataSource {
  final ApiConsumer api;

  ReviewProductDataSourceImp({required this.api});
  @override
  Future<List<ReviewModel>> getProductReviews(int productId) async{
 List<ReviewModel> productReviws=[];

    final response=await api.get("${EndPoint.getProductReviews}/$productId");
 for(var product in response){
   productReviws.add(ReviewModel.fromJson(product)); 
 }
 return productReviws;

  }
  
  @override
  Future<void> addReview( AddReviewParams params) async{
await api.post(EndPoint.addProductReviews,data: params.toJson());
  }
}