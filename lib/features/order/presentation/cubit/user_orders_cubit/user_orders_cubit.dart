import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:homesta/core/error/error_model.dart';
import 'package:homesta/features/order/data/models/user_orders_response.dart';
import 'package:homesta/features/order/domain/repos/order_repo.dart';
import 'user_orders_state.dart';

class UserOrdersCubit extends Cubit<UserOrdersState> {
  final OrderRepo repository;

  UserOrdersCubit(this.repository) : super(UserOrdersInitial());

  Future<void> getUserOrders() async {
    emit(UserOrdersLoading());
    try {
      final Either<ErrorModel, List<UserOrdersResponse>> result =
          await repository.getUserOrders();

      result.fold(
        (error) => emit(UserOrdersError(error.errorMessage)),
        (orders) => emit(UserOrdersLoaded(orders)),
      );
    } catch (e) {
      emit(UserOrdersError(e.toString()));
    }
  }
}
