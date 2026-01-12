import 'package:homesta/core/api/api_consumer.dart';
import 'package:homesta/core/api/end_ponits.dart';
import '../models/change_password__response_model.dart';
import '../models/forget_response_model.dart';
import '../models/login_response_model.dart';
import '../models/logout_response_model.dart';
import '../models/register_response_model.dart';
import '../models/resend_code_response_model.dart';
import '../models/reset_response_model.dart';
import '../models/verification_response_model.dart';

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
    //
    required List<Map<String, dynamic>> roles,

  }) async {
    final response = await api.post(
      EndPoint.signUp,
      data: {
        "email": email,
        "firstName": firstName,
        "lastName": lastName,
        "password": password,
        // "roles": [
        //   {"id": "1", "roleName": "Admin", "isSelected": true},
        //  // {"id": "2", "roleName": "User", "isSelected": false},
        //  // {"id": "3", "roleName": "Seller", "isSelected": true},
        // ],

        "roles": roles,

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
    // إذا رجع نص عادي
    if (response is String) {
      return ForgetPasswordResponseModel(message: response);
    }
    // إذا رجع JSON
    return ForgetPasswordResponseModel.fromJson(response);
  }

  //reset password
  Future<ResetPasswordResponseModel> resetPassword({
    required String email,
    required String newPassword,
  }) async {
    final response = await api.post(
      EndPoint.resetPassword,
      data: {
        "email": email,
        "newPassword": newPassword,
      },
    );
    return ResetPasswordResponseModel.fromJson(response);
  }
//verification
  Future<VerifyResetCodeResponseModel> verifyResetCode({
    required String email,
    required String code,
  }) async {
    final response = await api.post(
      EndPoint.verifyResetCode,
      data: {
        "email": email,
        "code": code,
      },
    );
    return VerifyResetCodeResponseModel.fromJson(response);
  }
//resend code
  Future<ResendResetCodeResponseModel> resendResetCode(String email) async {
    final response = await api.post(
      EndPoint.resendResetCode,
      data: {"email": email},
    );
    return ResendResetCodeResponseModel.fromJson(response);
  }
//manage pass (Update pass)
  Future<ChangePasswordResponseModel> changePassword({
    required String confirmNewPassword,
    required String currentPassword,
    required String newPassword,
  }) async {
    final response = await api.post(
      EndPoint.changePassword,
      data: {
        "confirmNewPassword": confirmNewPassword,
        "currentPassword": currentPassword,
        "newPassword": newPassword,
      },
    );
    return ChangePasswordResponseModel.fromJson(response);
  }

  //logout
  Future<LogoutResponseModel> logout() async {
    final response = await api.post( EndPoint.logOut,);
    return  LogoutResponseModel.fromJson(response);
  }

}
