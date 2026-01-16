import 'package:dartz/dartz.dart';
import 'package:homesta/core/error/error_model.dart';
import 'package:homesta/features/seller/profile/domain/entites/store_entiy.dart';
import 'package:homesta/features/seller/profile/domain/repo/store_repo.dart';

class MyStoreUseCase {
  final StoreRepo storeRepoImpl;
  MyStoreUseCase({required this.storeRepoImpl});

  Future<Either<ErrorModel, StoreEntity?>> call() async {
    return await storeRepoImpl.myStore();
  }
}
