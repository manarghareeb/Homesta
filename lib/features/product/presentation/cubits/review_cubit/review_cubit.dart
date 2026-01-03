import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homesta/features/product/domain/entities/params/add_review_params.dart';
import 'package:homesta/features/product/domain/usecases/add_review_use_case.dart';
import 'package:homesta/features/product/domain/usecases/get_product_review_use_case.dart';
import 'package:homesta/features/product/presentation/cubits/review_cubit/review_state.dart';


class ReviewsCubit extends Cubit<ReviewsState> {
  final GetProductReviewUseCase getReviewsUseCase;
  final AddReviewUseCase addReviewUseCase;

  ReviewsCubit(this.getReviewsUseCase,this.addReviewUseCase) : super(ReviewsInitial());

  Future<void> getReviews({required int productId}) async {
    emit(ReviewsLoading());

    final result = await getReviewsUseCase(productId);

    result.fold(
      (failure) {
        emit(ReviewsFailure(failure.errorMessage));
      },
      (reviews) {
        emit(ReviewsSuccess(reviews));
      },
    );
  }

  Future<void> addReview({required AddReviewParams params}) async {
    emit(AddReviewLoading());

    final result = await addReviewUseCase(params);

    result.fold(
      (failure) {
        emit(AddReviewsFailure(failure.errorMessage));
      },
      (reviews) {
        emit(AddReviewsSuccess());
      },
    );
  }
}
