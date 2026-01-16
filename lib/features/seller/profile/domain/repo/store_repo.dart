import 'package:dartz/dartz.dart';
import 'package:homesta/core/error/error_model.dart';
import 'package:homesta/features/seller/profile/domain/entites/params/create_store_params.dart';
import 'package:homesta/features/seller/profile/domain/entites/store_entiy.dart';

import '../../data/models/all_store_response_model.dart';

abstract class StoreRepo {
Future<Either<ErrorModel, StoreEntity>> createStore(CreateStoreParams params);
Future<Either<ErrorModel, StoreEntity>> getStore(int id);
Future<Either<ErrorModel, List<SimpleStoreModel>>> getAllStores();
Future<Either<ErrorModel, Unit>> deleteStore(int id);
Future<Either<ErrorModel, StoreEntity?>> myStore();
}