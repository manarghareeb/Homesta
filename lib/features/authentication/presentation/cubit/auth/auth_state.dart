part of 'auth_cubit.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

//login
class AuthSuccess extends AuthState {
  final LoginResponseModel user;
  AuthSuccess(this.user);
}

//signUp
class RegisterSuccess extends AuthState {
  final RegisterResponseModel response;
  RegisterSuccess(this.response);
}

//forget password
class ForgetPasswordSuccess extends AuthState {
  final ForgetPasswordResponseModel response;
  ForgetPasswordSuccess(this.response);
}

//reset password
class ResetPasswordSuccess extends AuthState {
  final ResetPasswordResponseModel response;
  ResetPasswordSuccess(this.response);
}

//logout
class LogoutSuccess extends AuthState {
  final LogoutResponseModel response;
  LogoutSuccess(this.response);
}

class AuthFailure extends AuthState {
  final String error;
  AuthFailure(this.error);
}
