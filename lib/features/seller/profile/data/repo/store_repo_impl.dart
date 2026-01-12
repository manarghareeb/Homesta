import 'package:dartz/dartz.dart';
import 'package:homesta/core/api/api_consumer.dart';
import 'package:homesta/core/error/error_model.dart';
import 'package:homesta/core/error/expections.dart';
import 'package:homesta/features/seller/profile/data/data_source/store_data_source.dart';
import 'package:homesta/features/seller/profile/domain/entites/params/create_store_params.dart';
import 'package:homesta/features/seller/profile/domain/entites/store_entiy.dart';
import 'package:homesta/features/seller/profile/domain/repo/store_repo.dart';

class StoreRepoImpl implements StoreRepo{
  final StoreDataSource storeDataSource;
  StoreRepoImpl({required this.storeDataSource});
  @override
  Future<Either<ErrorModel, Unit>> createStore(CreateStoreParams params) async{
    try{
      await storeDataSource.createStore(params);
      return const Right(unit);
    }on ServerException catch(e){
      return Left(e.errModel);
    }
 
  }

  @override
  Future<Either<ErrorModel, StoreEntity>> getStore(int id) async{
try {
 final store = await storeDataSource.getStore(id);
 return Right(store);
} on ServerException catch (e) {
 return Left(e.errModel);
}
  }
}