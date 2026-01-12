import 'package:dartz/dartz.dart';
import 'package:homesta/core/error/error_model.dart';
import 'package:homesta/features/seller/profile/domain/entites/store_entiy.dart';
import 'package:homesta/features/seller/profile/domain/repo/store_repo.dart';

class CreateStoreUseCase {
  final StoreRepo storeRepo;
  CreateStoreUseCase(this.storeRepo);
  Future<Either<ErrorModel, StoreEntity>> call(params) async {
    return await storeRepo.createStore(params);
  }
}