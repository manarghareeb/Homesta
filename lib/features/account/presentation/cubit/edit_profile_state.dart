import 'package:homesta/features/account/data/models/user_response.dart';

abstract class EditProfileState {}

class EditProfileInitial extends EditProfileState {}
class EditProfileLoading extends EditProfileState {}
class EditProfileSuccess extends EditProfileState {
  final UserResponse user;
  EditProfileSuccess(this.user);
}
class EditProfileFailure extends EditProfileState {
  final String message;
  EditProfileFailure(this.message);
}
class EditProfileLoaded extends EditProfileState
{
  final UserResponse user;
  EditProfileLoaded(this.user);
}