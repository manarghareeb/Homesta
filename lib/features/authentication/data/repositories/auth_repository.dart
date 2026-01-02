import '../datasources/auth_remote_data_source.dart';
import '../models/forget_response_model.dart';
import '../models/login_response_model.dart';
import '../models/logout_response_model.dart';
import '../models/register_response_model.dart';
import '../models/reset_response_model.dart';

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
      ) {
    return remote.register(
      firstName: firstName,
      lastName: lastName,
      email: email,
      password: password,
      agreeTerms: agreeTerms,
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
    return remote.resetPassword(
      email: email,
      code: code,
      newPassword: newPassword,
    );
  }
  //logout
  Future<LogoutResponseModel> logout() async {
    return await remote.logout();
  }

}
