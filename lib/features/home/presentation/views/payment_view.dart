import 'package:flutter/material.dart';
import 'package:homesta/core/widgets/custom_button_widget.dart';
import 'package:homesta/features/account/presentation/views/payment_account_screen.dart';

class PaymentView extends StatelessWidget {
  final VoidCallback onNext;
  final VoidCallback onBack;
  const PaymentView(
      {super.key, required this.onNext, required this.onBack});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const PaymentWidget(),
          CustomButtonWidget(
            buttonText: 'Continue', 
            onPressed: onNext
          ),
        ],
      ),
    );
  }
}