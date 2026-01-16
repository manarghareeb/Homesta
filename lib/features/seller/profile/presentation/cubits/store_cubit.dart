import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homesta/features/seller/profile/domain/entites/params/create_store_params.dart';
import 'package:homesta/features/seller/profile/domain/use_cases/create_store_use_case.dart';
import 'package:homesta/features/seller/profile/domain/use_cases/get_store_use_case.dart';
import 'package:homesta/features/seller/profile/domain/use_cases/my_store_use_case.dart';
import 'package:homesta/features/seller/profile/presentation/cubits/store_state.dart';


class StoreCubit extends Cubit<StoreState> {
  final CreateStoreUseCase createStoreUseCase;
  final GetStoreUseCase getStoreUseCase;
  final MyStoreUseCase myStoreUseCase;

  StoreCubit({required this.createStoreUseCase, required this.getStoreUseCase, required this.myStoreUseCase}) : super(StoreInitial());

  Future<void> createStore(CreateStoreParams params) async {
    emit(StoreLoading());
    final result = await createStoreUseCase(params);

    result.fold(
      (failure) => emit(StoreError(failure.errorMessage)),
      (store) => emit(StoreSuccess(store)),
    );
  }

  getStore(int id) async {
    emit(GetStoreLoading());
    final result = await getStoreUseCase(id);

    result.fold(
      (failure) => emit(GetStoreError(failure.errorMessage)),
      (store) => emit(GetStoreSuccess(store)),
    );
  }


}
