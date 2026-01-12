import 'package:equatable/equatable.dart';
import 'package:homesta/features/order/data/models/payment_response/payment_response.dart';

abstract class PaymentState extends Equatable {
  const PaymentState();

  @override
  List<Object?> get props => [];
}

class PaymentInitial extends PaymentState {}

class PaymentLoading extends PaymentState {}

class PaymentSuccess extends PaymentState {
  final PaymentResponse paymentResponse; 

  const PaymentSuccess(this.paymentResponse);

  @override
  List<Object?> get props => [paymentResponse];
}

class PaymentFailure extends PaymentState {
  final String error;

  const PaymentFailure(this.error);

  @override
  List<Object?> get props => [error];
}
