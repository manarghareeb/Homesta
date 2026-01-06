import 'package:flutter/material.dart';
import 'package:homesta/core/widgets/custom_button_widget.dart';
import 'package:homesta/features/payment/presentation/widgets/payment_widget.dart';

class PaymentView extends StatefulWidget {
  final VoidCallback onNext;
  final VoidCallback onBack;
  const PaymentView({super.key, required this.onNext, required this.onBack});

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
          CustomButtonWidget(
            buttonText: 'Continue',
            onPressed: () {
              if (selectedPayment.isNotEmpty) {
                widget.onNext();
              }
            },
          ),
        ],
      ),
    );
  }
}
