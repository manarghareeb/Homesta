import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homesta/features/order/domain/repos/order_repo.dart';
import 'package:homesta/features/order/presentation/cubit/place_order_cubit/place_order_state.dart';

class PlaceOrderCubit extends Cubit<PlaceOrderState> {
  final OrderRepo orderRepo;

  PlaceOrderCubit(this.orderRepo) : super(PlaceOrderInitial());

  Future<void> makePlaceOrder({
    required String userId,
  }) async {
    emit(PlaceOrderLoading());

    final response = await orderRepo.makePlaceOrder(userId: userId);

    response.fold(
      (errorModel) => emit(PlaceOrderFailure(errorModel.errorMessage)),
      (paymentResponse) => emit(PlaceOrderSuccess(paymentResponse)),
    );
  }
}
