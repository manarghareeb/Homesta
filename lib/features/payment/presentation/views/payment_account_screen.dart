import 'package:flutter/material.dart';
import 'package:homesta/core/widgets/custom_app_bar_widget.dart';
import 'package:homesta/features/payment/presentation/widgets/payment_widget.dart';

class PaymentAccountScreen extends StatefulWidget {
  const PaymentAccountScreen({super.key});

  @override
  State<PaymentAccountScreen> createState() => _PaymentAccountScreenState();
}

class _PaymentAccountScreenState extends State<PaymentAccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBarWidget(text: 'Payment Method'),
      body: PaymentWidget(onPaymentSelected: (payment) {}),
    );
  }
}
