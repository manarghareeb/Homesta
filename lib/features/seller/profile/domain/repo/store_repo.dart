import 'package:dartz/dartz.dart';
import 'package:homesta/core/error/error_model.dart';
import 'package:homesta/features/seller/profile/domain/entites/params/create_store_params.dart';
import 'package:homesta/features/seller/profile/domain/entites/store_entiy.dart';

abstract class StoreRepo {
Future<Either<ErrorModel, Unit>> createStore(CreateStoreParams params);
Future<Either<ErrorModel, StoreEntity>> getStore(int id);
}