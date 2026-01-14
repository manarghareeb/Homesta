import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:homesta/core/error/error_model.dart';
import 'package:homesta/features/account/data/models/user_response.dart';

abstract class UserRepo {
  Future<Either<ErrorModel, UserResponse>> updateUser(FormData formData, String id);
  Future<Either<ErrorModel, UserResponse>> getUserUseCase(String id);
}
