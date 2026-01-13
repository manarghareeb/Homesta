
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homesta/features/seller/product/domain/usecases/upload_product_images_use_case.dart';
import 'package:homesta/features/seller/product/presentation/cubits/upload_image_cubit/upload_image_state.dart';

class ProductImageCubit extends Cubit<ProductImageState> {
  final UploadProductImagesUseCase uploadUseCase;

  ProductImageCubit(this.uploadUseCase) : super(ProductImageInitial());

  Future<void> uploadImages({required int productId, required List<File> images}) async {
    emit(ProductImageLoading());
    final result = await uploadUseCase(productId: productId, images: images);

    result.fold(
      (err) => emit(ProductImageError(err.errorMessage)),
      (imgs) => emit(ProductImageSuccess(imgs)),
    );
  }
}