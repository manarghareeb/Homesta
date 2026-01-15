import '../datasources/auth_remote_data_source.dart';
import '../models/change_password__response_model.dart';
import '../models/forget_response_model.dart';
import '../models/login_response_model.dart';
import '../models/logout_response_model.dart';
import '../models/register_response_model.dart';
import '../models/resend_code_response_model.dart';
import '../models/reset_response_model.dart';
import '../models/verification_response_model.dart';

class AuthRepository {
  final AuthRemoteDataSource remote;

  AuthRepository(this.remote);
  //login
  Future<LoginResponseModel> login(String email, String password) {
    return remote.login(email: email, password: password);
  }

  //signUp
  Future<RegisterResponseModel> register(
    String firstName,
    String lastName,
    String email,
    String password,
    bool agreeTerms,
    List<Map<String, dynamic>> roles,
  ) {
    return remote.register(
      firstName: firstName,
      lastName: lastName,
      email: email,
      password: password,
      agreeTerms: agreeTerms,
      roles: roles,
    );
  }

  //forget password
  Future<ForgetPasswordResponseModel> forgetPassword(String email) async {
    return await remote.forgetPassword(email);
  }

  //reset password
  Future<ResetPasswordResponseModel> resetPassword(
    String email,
    String code,
    String newPassword,
  ) {
    return remote.resetPassword(email: email, code: code, newPassword: newPassword);
  }

  //verification
  Future<VerifyResetCodeResponseModel> verifyResetCode(
    String email,
    String code,
  ) {
    return remote.verifyResetCode(email: email, code: code);
  }

  //resend code
  Future<ResendResetCodeResponseModel> resendResetCode(String email) {
    return remote.resendResetCode(email);
  }

  //manage pass (Update pass)
  Future<ChangePasswordResponseModel> changePassword(
    String confirmNewPassword,
    String currentPassword,
    String newPassword,
  ) {
    return remote.changePassword(
      confirmNewPassword: confirmNewPassword,
      currentPassword: currentPassword,
      newPassword: newPassword,
    );
  }

  //logout
  Future<LogoutResponseModel> logout() async {
    return await remote.logout();
  }
}
