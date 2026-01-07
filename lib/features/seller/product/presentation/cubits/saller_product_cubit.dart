import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homesta/features/seller/product/domain/entitiy/params/add_product_params.dart';
import 'package:homesta/features/seller/product/domain/usecases/add_product_use_case.dart';
import 'package:homesta/features/seller/product/presentation/cubits/saller_product_state.dart';


class SellerProductCubit extends Cubit<SellerProductState> {
final AddProductUseCase addProductUseCase;

  SellerProductCubit({
    required this.addProductUseCase
  }) : super(SellerProductInitial());

  /// 🔹 Get seller products
  Future<void> addSellerProducts(AddProductParams params) async {
    emit(SellerAddProductLoading());

    final result = await addProductUseCase(params);

    result.fold(
      (failure) => emit(SellerAddProductError(failure.errorMessage)),
      (products) => emit(SellerAddProductSuccess()),
    );
  }

}
