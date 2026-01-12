import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homesta/features/order/domain/repos/order_repo.dart';
import 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  final OrderRepo orderRepo;

  PaymentCubit(this.orderRepo) : super(PaymentInitial());

  Future<void> makePayment({
    required int orderId,
    required String paymentMethod,
  }) async {
    emit(PaymentLoading());

    final response = await orderRepo.makePayment(
      orderId: orderId, 
      paymentMethod: paymentMethod
    );

    response.fold(
      (errorModel) => emit(PaymentFailure(errorModel.errorMessage)),
      (paymentResponse) => emit(PaymentSuccess(paymentResponse)),
    );
  }
}
