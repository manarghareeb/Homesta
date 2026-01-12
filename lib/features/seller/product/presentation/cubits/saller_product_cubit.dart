import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homesta/features/seller/product/domain/entitiy/params/add_product_params.dart';
import 'package:homesta/features/seller/product/domain/usecases/add_product_use_case.dart';
import 'package:homesta/features/seller/product/domain/usecases/get_saller_product_usecase.dart';
import 'package:homesta/features/seller/product/presentation/cubits/saller_product_state.dart';


class SellerProductCubit extends Cubit<SellerProductState> {
final AddProductUseCase addProductUseCase;
final GetSallerProductUsecase getSallerProductUsecase;

  SellerProductCubit({
    required this.addProductUseCase,
    required this.getSallerProductUsecase,
  }) : super(SellerProductInitial());

  /// 🔹 add seller products
  /// 🔹 Get seller products
  Future<void> addSellerProducts(AddProductParams params) async {
    emit(SellerAddProductLoading());

    final result = await addProductUseCase(params);

    result.fold(
      (failure) => emit(SellerAddProductError(failure.errorMessage)),
      (products) => emit(SellerAddProductSuccess()),
    );
  }
  /// 🔹 Get seller products
  Future<void> getSellerProducts(int id) async {
    emit(SellerGetProductLoading());

    final result = await getSallerProductUsecase(id);

    result.fold(
      (failure) => emit(SellerGetProductError(failure.errorMessage)),
      (products) => emit(SellerGetProductSuccess(products)),
    );
  }

}
