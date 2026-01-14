import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homesta/features/product/domain/usecases/get_product_images_use_case.dart';
import 'package:homesta/features/product/presentation/cubits/get_product_images_cubit.dart/get_ptoduct_image_state.dart';

class GetProductImagesCubit extends Cubit<GetPtoductImagesState> {
  GetProductImagesCubit(this.getProductImagesUseCase) : super(GetProductImageInitial());
  final GetProductImagesUseCase getProductImagesUseCase;

  Future<void> getProductImages(int productId) async {

  if (isClosed) return;
    emit(GetProductImageLoading());

    final res = await getProductImagesUseCase(productId);
  res.fold(
    (l) {
      if (!isClosed) emit(GetProductImageFailure(l.errorMessage));
    },
    (r) {
      if (!isClosed) emit(GetPtoductImageSuccess(r));
    },
  );
  }
}
