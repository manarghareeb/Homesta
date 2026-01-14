import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:homesta/core/error/error_model.dart';
import 'package:homesta/features/account/data/models/user_response.dart';
import 'package:homesta/features/account/domain/repositories/user_repo.dart';

class UpdateUserUseCase {
  final UserRepo repo;

  UpdateUserUseCase(this.repo);

  Future<Either<ErrorModel, UserResponse>> call(FormData formData, String id) {
    return repo.updateUser(formData, id);
  }
}

class GetUserUseCase {
  final UserRepo repo;

  GetUserUseCase(this.repo);

  Future<Either<ErrorModel, UserResponse>> call(String id) {
    return repo.getUserUseCase(id);
  }
}