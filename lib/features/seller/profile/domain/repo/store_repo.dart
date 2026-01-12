import 'package:dartz/dartz.dart';
import 'package:homesta/core/error/error_model.dart';
import 'package:homesta/features/seller/profile/domain/entites/params/create_store_params.dart';

abstract class StoreRepo {
Future<Either<ErrorModel, Unit>> createStore(CreateStoreParams params);
}