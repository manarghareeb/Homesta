import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homesta/features/seller/profile/domain/entites/params/create_store_params.dart';
import 'package:homesta/features/seller/profile/domain/use_cases/create_store_use_case.dart';
import 'package:homesta/features/seller/profile/domain/use_cases/get_store_use_case.dart';
import 'package:homesta/features/seller/profile/domain/use_cases/get_all_stores_use_case.dart';
import 'package:homesta/features/seller/profile/presentation/cubits/store_state.dart';

import '../../domain/use_cases/delete_store_use_case.dart';

class StoreCubit extends Cubit<StoreState> {
  final CreateStoreUseCase createStoreUseCase;
  final GetStoreUseCase getStoreUseCase;
  final GetAllStoresUseCase getAllStoresUseCase;
  final DeleteStoreUseCase deleteStoreUseCase;

  StoreCubit({
    required this.createStoreUseCase,
    required this.getStoreUseCase,
    required this.getAllStoresUseCase,
    required this.deleteStoreUseCase,
  }) : super(StoreInitial());


  Future<void> createStore(CreateStoreParams params) async {
    emit(StoreLoading());
    final result = await createStoreUseCase(params);

    result.fold(
          (failure) => emit(StoreError(failure.errorMessage)),
          (store) => emit(StoreSuccess(store)), // متجر واحد
    );
  }

  Future<void> getStore(int id) async {
    emit(GetStoreLoading());
    final result = await getStoreUseCase(id);

    result.fold(
          (failure) => emit(GetStoreError(failure.errorMessage)),
          (store) => emit(GetStoreSuccess(store)),
    );
  }

  Future<void> getAllStores() async {
    emit(GetStoreLoading());
    final result = await getAllStoresUseCase();

    result.fold(
          (failure) => emit(StoreError(failure.errorMessage)),
          (stores) => emit(StoresSuccess(stores)),
    );
  }

  // Future<void> deleteStore(int id) async {
  //   emit(StoreLoading());
  //   final result = await deleteStoreUseCase(id);
  //   result.fold(
  //         (failure) => emit(StoreError(failure.errorMessage)),
  //         (_) => emit(StoreDeletedSuccess()),
  //   );
  // }


  Future<void> deleteStore(int id) async {
    emit(StoreLoading());
    final result = await deleteStoreUseCase(id);

    result.fold(
          (error) => emit(StoreError(error.errorMessage)),
          (_) async {
        final storesResult = await getAllStoresUseCase();
        storesResult.fold(
              (error) => emit(StoreError(error.errorMessage)),
              (stores) => emit(StoresSuccess(stores)),
        );
      },
    );
  }
}