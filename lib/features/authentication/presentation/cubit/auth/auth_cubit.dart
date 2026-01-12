import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homesta/core/api/api_keys.dart';
import 'package:homesta/core/error/expections.dart';
import '../../../../../core/cache/cache_helper.dart';
import '../../../data/models/change_password__response_model.dart';
import '../../../data/models/forget_response_model.dart';
import '../../../data/models/login_response_model.dart';
import '../../../data/models/logout_response_model.dart';
import '../../../data/models/register_response_model.dart';
import '../../../data/models/resend_code_response_model.dart';
import '../../../data/models/reset_response_model.dart';
import '../../../data/models/verification_response_model.dart';
import '../../../data/repositories/auth_repository.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository repo;

  AuthCubit(this.repo) : super(AuthInitial());
  //logIn
  Future<void> login(String email, String password) async {
    emit(AuthLoading());
    try {

      final result = await repo.login(email, password);
      emit(AuthSuccess(result));
    } on ServerException catch (e) {
      emit(AuthFailure(e.errModel.errorMessage));
    }
  }

  //signUp
  Future<void> register(
    String firstName,
    String lastName,
    String email,
    String password,
    bool agreeTerms,
    List<Map<String, dynamic>> roles,
  ) async {
    emit(AuthLoading());
    try {
      final result = await repo.register(
        firstName,
        lastName,
        email,
        password,
        agreeTerms,
        roles,
      );
      emit(RegisterSuccess(result));
    } on ServerException catch (e) {
      emit(AuthFailure(e.errModel.errorMessage));
    }
  }

  //forget password
  Future<void> forgetPassword(String email) async {
    emit(AuthLoading());
    try {
      final result = await repo.forgetPassword(email);
      emit(ForgetPasswordSuccess(result));
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  //reset password
  Future<void> resetPassword(
      String email,
      String newPassword,
      ) async {
    emit(AuthLoading());
    try {
      final result = await repo.resetPassword(email, newPassword);
      emit(ResetPasswordSuccess(result));
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }
  // verification
  Future<void> verifyResetCode(String email, String code) async {
    emit(AuthLoading());
    try {
      final result = await repo.verifyResetCode(email, code);
      emit(VerifyResetCodeSuccess(result));
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }
// resend code
  Future<void> resendResetCode(String email) async {
    emit(AuthLoading());
    try {
      final result = await repo.resendResetCode(email);
      emit(ResendResetCodeSuccess(result));
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

//manage pass (Update pass)
  Future<void> changePassword(
      String confirmNewPassword,
      String currentPassword,
      String newPassword,
      ) async {
    emit(AuthLoading());
    try {
      final result = await repo.changePassword(
        confirmNewPassword,
        currentPassword,
        newPassword,
      );
      emit(ChangePasswordSuccess(result));
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }
//logout
  Future<void> logout() async {
    emit(AuthLoading());
    try {
      final result = await repo.logout();
      await CacheHelper().removeData(key: ApiKeys.token);
      emit(LogoutSuccess(result));
    } catch (error) {
      emit(AuthFailure(error.toString()));
    }
  }
}
