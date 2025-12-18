import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/features/home/presentation/widgets/payment_container_item.dart';

class PaymentMethodSelector extends StatefulWidget {
  const PaymentMethodSelector({super.key});

  @override
  State<PaymentMethodSelector> createState() => _PaymentMethodSelectorState();
}

class _PaymentMethodSelectorState extends State<PaymentMethodSelector> {
  String selectedMethod = 'credit';

  final List<Map<String, dynamic>> paymentMethods = [
    {
      'id': 'credit',
      'icon': Icons.credit_card,
      'text': 'Credit Card',
      'subText': 'Pay with credit card',
    },
    {
      'id': 'cash',
      'icon': Icons.attach_money,
      'text': 'Cash on Delivery',
      'subText': 'Pay when you receive',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: paymentMethods.map((method) {
        return Padding(
          padding: EdgeInsets.only(bottom: 16.h),
          child: PaymentContainerItem(
            icon: method['icon'],
            text: method['text'],
            subText: method['subText'],
            isSelected: selectedMethod == method['id'],
            onTap: () => setState(() => selectedMethod = method['id']),
          ),
        );
      }).toList(),
    );
  }
}
