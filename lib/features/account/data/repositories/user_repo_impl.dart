import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:homesta/core/error/error_model.dart';
import 'package:homesta/features/account/data/datasources/user_data_source.dart';
import 'package:homesta/features/account/data/models/user_response.dart';
import 'package:homesta/features/account/domain/repositories/user_repo.dart';

class UserRepoImpl implements UserRepo {
  final UserDataSource dataSource;

  UserRepoImpl(this.dataSource);

  @override
  Future<Either<ErrorModel, UserResponse>> updateUser(FormData formData, String id) async {
    try {
      final result = await dataSource.updateUser(formData, id);
      return Right(result);
    } catch (e) {
      return Left(ErrorModel(errorMessage: e.toString()));
    }
  }
  Future<Either<ErrorModel, UserResponse>> getUserUseCase(String id) async {
    try {
      final result = await dataSource.getUserUseCaser(id);
      return Right(result);
    } catch (e) {
      return Left(ErrorModel(errorMessage: e.toString()));
    }
  }
}
