import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homesta/features/product/domain/usecases/get_product_review_use_case.dart';
import 'package:homesta/features/product/presentation/cubits/review_cubit/review_state.dart';


class ReviewsCubit extends Cubit<ReviewsState> {
  final GetProductReviewUseCase getReviewsUseCase;

  ReviewsCubit(this.getReviewsUseCase) : super(ReviewsInitial());

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
}
