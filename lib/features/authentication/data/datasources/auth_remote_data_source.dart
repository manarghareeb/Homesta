import 'package:homesta/core/api/api_consumer.dart';
import 'package:homesta/core/api/end_ponits.dart';
import '../models/forget_response_model.dart';
import '../models/login_response_model.dart';
import '../models/logout_response_model.dart';
import '../models/register_response_model.dart';
import '../models/reset_response_model.dart';

class AuthRemoteDataSource {
  final ApiConsumer api;

  AuthRemoteDataSource(this.api);
  //login
  Future<LoginResponseModel> login({
    required String email,
    required String password,
  }) async {
    final response = await api.post(
      EndPoint.signIn,
      data: {"email": email, "password": password},
    );
    return LoginResponseModel.fromJson(response);
  }

  //SignUp
  Future<RegisterResponseModel> register({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required bool agreeTerms,
  }) async {
    final response = await api.post(
      EndPoint.signUp,
      data: {
        "email": email,
        "firstName": firstName,
        "lastName": lastName,
        "password": password,
        "roles": [
          {"id": "2", "roleName": "User", "isSelected": true},
        ],
        "agreeTerms": agreeTerms,
      },
    );
    return RegisterResponseModel.fromJson(response);
  }

  //forget password
  Future<ForgetPasswordResponseModel> forgetPassword(String email) async {
    final response = await api.post(
      EndPoint.forgetPassword,
      data: {"email": email},
    );
    return ForgetPasswordResponseModel.fromJson(response);
  }

  //reset password
  Future<ResetPasswordResponseModel> resetPassword({
    required String email,
    required String code,
    required String newPassword,
  }) async {
    final response = await api.post(
      EndPoint.resetPassword,
      data: {"email": email, "code": code, "newPassword": newPassword},
    );
    return ResetPasswordResponseModel.fromJson(response);
  }

  //logout
  Future<LogoutResponseModel> logout() async {
    final response = await api.post(EndPoint.logOut);
    return LogoutResponseModel.fromJson(response);
  }
}
