import 'package:dartz/dartz.dart';
import 'package:homesta/core/error/error_model.dart';
import 'package:homesta/core/error/expections.dart';
import 'package:homesta/features/seller/profile/data/data_source/store_data_source.dart';
import 'package:homesta/features/seller/profile/domain/entites/params/create_store_params.dart';
import 'package:homesta/features/seller/profile/domain/entites/store_entiy.dart';
import 'package:homesta/features/seller/profile/domain/repo/store_repo.dart';

import '../models/all_store_response_model.dart';

class StoreRepoImpl implements StoreRepo{
  final StoreDataSource storeDataSource;
  StoreRepoImpl({required this.storeDataSource});
  @override
  Future<Either<ErrorModel, StoreEntity>> createStore(CreateStoreParams params) async{
    try{
   final store =   await storeDataSource.createStore(params);
      return  Right(store);
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

  @override
  Future<Either<ErrorModel, List<SimpleStoreModel>>> getAllStores() async {
    try {
      final stores = await storeDataSource.getAllStores();
      return Right(stores);
    } on ServerException catch (e) {
      return Left(e.errModel);
    }
  }
  @override
  Future<Either<ErrorModel, Unit>> deleteStore(int id) async {
    try {
      await storeDataSource.deleteStore(id);
      return const Right(unit);
    } on ServerException catch (e) {
      return Left(e.errModel);
    }
  }
}
