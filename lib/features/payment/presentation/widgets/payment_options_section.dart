import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:homesta/features/payment/presentation/widgets/payment_option_tile.dart';
import 'package:homesta/features/payment/presentation/widgets/credit_card_form_section.dart';

class PaymentOptionsSection extends StatefulWidget {
  const PaymentOptionsSection({super.key});

  @override
  State<PaymentOptionsSection> createState() => _PaymentOptionsSectionState();
}

class _PaymentOptionsSectionState extends State<PaymentOptionsSection> {
  String selectedPaymentMethod = 'credit_card';

  final TextEditingController cardHolderController = TextEditingController();
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController expiryDateController = TextEditingController();
  final TextEditingController cvvController = TextEditingController();

  @override
  void dispose() {
    cardHolderController.dispose();
    cardNumberController.dispose();
    expiryDateController.dispose();
    cvvController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PaymentOptionTile(
          value: 'credit_card',
          groupValue: selectedPaymentMethod,
          title: 'Credit Card',
          trailing: SvgPicture.asset('assets/images/payment icon/visa_icon.svg'),
          onChanged: (v) => setState(() => selectedPaymentMethod = v),
        ),
        SizedBox(height: 12.h),
        PaymentOptionTile(
          value: 'apple_pay',
          groupValue: selectedPaymentMethod,
          title: 'Apple Pay',
          trailing:
              SvgPicture.asset('assets/images/payment icon/apple_pay_icon.svg'),
          onChanged: (v) => setState(() => selectedPaymentMethod = v),
        ),
        SizedBox(height: 12.h),
        PaymentOptionTile(
          value: 'google_pay',
          groupValue: selectedPaymentMethod,
          title: 'Google Pay',
          trailing:
              SvgPicture.asset('assets/images/payment icon/google_pay_icon.svg'),
          onChanged: (v) => setState(() => selectedPaymentMethod = v),
        ),
        SizedBox(height: 12.h),
        PaymentOptionTile(
          value: 'paypal',
          groupValue: selectedPaymentMethod,
          title: 'PayPal',
          trailing: SvgPicture.asset('assets/images/payment icon/paypal_icon.svg'),
          onChanged: (v) => setState(() => selectedPaymentMethod = v),
        ),
        if (selectedPaymentMethod == 'credit_card') ...[
          CreditCardFormSection(
            cardHolderController: cardHolderController,
            cardNumberController: cardNumberController,
            expiryDateController: expiryDateController,
            cvvController: cvvController,
          ),
        ],
      ],
    );
  }
}
