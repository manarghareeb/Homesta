import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homesta/core/widgets/custom_button_widget.dart';
import 'package:homesta/features/order/data/models/payment_response/payment_response.dart';
import 'package:homesta/features/order/presentation/cubit/payment_cubit/payment_cubit.dart';
import 'package:homesta/features/order/presentation/cubit/payment_cubit/payment_state.dart';
import 'package:homesta/features/payment/presentation/widgets/payment_widget.dart';

class PaymentView extends StatefulWidget {
  final Function(PaymentResponse) onNext;
  final VoidCallback onBack;
  final int orderId;
  const PaymentView({
    super.key,
    required this.onNext,
    required this.onBack,
    required this.orderId,
  });

  @override
  State<PaymentView> createState() => _PaymentViewState();
}

class _PaymentViewState extends State<PaymentView> {
  String selectedPayment = '';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          PaymentWidget(
            onPaymentSelected: (payment) {
              setState(() {
                selectedPayment = payment;
              });
            },
          ),
          BlocConsumer<PaymentCubit, PaymentState>(
            listener: (context, state) {
              if (state is PaymentSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Payment successful!')),
                );
                widget.onNext(state.paymentResponse);
              } else if (state is PaymentFailure) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(state.error)));
              }
            },
            builder: (context, state) {
              if (state is PaymentLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              return CustomButtonWidget(
                buttonText: 'Continue',
                onPressed: () {
                  if (selectedPayment.isEmpty) return;
                  context.read<PaymentCubit>().makePayment(
                    orderId: widget.orderId,
                    paymentMethod: "CashOnDelivery",
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
