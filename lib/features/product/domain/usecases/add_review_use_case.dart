import 'package:dartz/dartz.dart';
import 'package:homesta/core/error/error_model.dart';
import 'package:homesta/features/product/domain/entities/params/add_review_params.dart';
import 'package:homesta/features/product/domain/repositories/product_repository.dart';

class AddReviewUseCase {
    final ProductRepository productRepository;

  AddReviewUseCase({required this.productRepository});
  Future<Either<ErrorModel,Unit>> call(AddReviewParams addReviewParams)=>productRepository.addReview(addReviewParams);

}