import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:homesta/features/account/domain/usecases/update_user_use_case.dart';
import 'edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  final UpdateUserUseCase updateUserUseCase;
  final GetUserUseCase getUserUseCase;

  EditProfileCubit(this.updateUserUseCase, this.getUserUseCase) : super(EditProfileInitial());

  Future<void> updateUser(FormData formData, String id) async {
    emit(EditProfileLoading());
    final result = await updateUserUseCase(formData, id);

    result.fold(
          (error) => emit(EditProfileFailure(error.errorMessage)),
          (user) => emit(EditProfileSuccess(user)),
    );
  }

  Future<void> loadUser(String id) async {
    emit(EditProfileLoading());
    final result = await getUserUseCase(id);

    result.fold(
          (error) => emit(EditProfileFailure(error.errorMessage)),
          (user) => emit(EditProfileLoaded(user)),
    );
  }
}
