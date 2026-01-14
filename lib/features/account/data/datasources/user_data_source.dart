import 'package:dio/dio.dart';
import 'package:homesta/features/account/data/models/user_response.dart';
import 'package:homesta/core/api/api_consumer.dart';

abstract class UserDataSource {
  Future<UserResponse> updateUser(FormData formData, String id);
  Future<UserResponse> getUserUseCaser(String id);
}

class UserDataSourceImpl implements UserDataSource {
  final ApiConsumer api;

  UserDataSourceImpl({required this.api});

  @override
  Future<UserResponse> updateUser(FormData formData, String id) async {
    final response = await api.patch("api/User/$id", data: formData, isFromData: true);
    return UserResponse.fromJson(response);
  }
  @override
  Future<UserResponse> getUserUseCaser(String id) async {
    final response = await api.patch("api/User/$id",);
    return UserResponse.fromJson(response);
  }
}
