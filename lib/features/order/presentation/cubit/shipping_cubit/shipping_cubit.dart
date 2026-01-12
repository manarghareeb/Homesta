import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homesta/features/order/domain/repos/order_repo.dart';
import 'shipping_state.dart';

class ShippingCubit extends Cubit<ShippingState> {
  final OrderRepo orderRepo;

  ShippingCubit(this.orderRepo) : super(ShippingInitial());

  Future<void> addShipping(Map<String, dynamic> shippingData) async {
    emit(ShippingLoading());

    final response = await orderRepo.addShipping(shippingData);

    response.fold(
      (errorModel) => emit(ShippingFailure(errorModel.errorMessage)),
      (shippingId) => emit(ShippingSuccess(shippingId)),
    );
  }
}
