import 'package:dartz/dartz.dart';
import 'package:homesta/core/error/error_model.dart';
import 'package:homesta/features/seller/profile/domain/entites/store_entiy.dart';
import 'package:homesta/features/seller/profile/domain/repo/store_repo.dart';

class GetStoreUseCase {
  final StoreRepo storeRepo;

  GetStoreUseCase(this.storeRepo);

  Future<Either<ErrorModel, StoreEntity>> call(int id) async {
    return await storeRepo.getStore(id);
  }
}