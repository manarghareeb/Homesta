import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/theming/styles.dart';
import 'package:homesta/core/widgets/custom_app_bar_widget.dart';
import 'package:homesta/features/account/presentation/widgets/card_form_widget.dart';
import 'package:homesta/features/account/presentation/widgets/payment_option_widget.dart';

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
      body: PaymentWidget(),
    );
  }
}

class PaymentWidget extends StatefulWidget {
  const PaymentWidget({super.key});

  @override
  State<PaymentWidget> createState() => _PaymentWidgetState();
}

class _PaymentWidgetState extends State<PaymentWidget> {
  String selectedPayment = 'Paypal';
  bool addNewCard = false;

  String selectedPaymentMethod = 'credit_card';

  void onSelectPayment(String title, bool isCardOption) {
    setState(() {
      selectedPayment = title;
      addNewCard = isCardOption && title == 'Add New Credit/ Debit Card';
    });
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Select Payment Method', style: TextStyles.font16BlackW500),
              SizedBox(height: 16.h),
              PaymentOptionWidget(
                title: 'Paypal',
                icon: Icons.payment,
                groupValue: selectedPayment,
                onSelect: onSelectPayment,
              ),
              SizedBox(height: 16.h),
              PaymentOptionWidget(
                title: 'Google Pay',
                icon: Icons.account_balance_wallet,
                groupValue: selectedPayment,
                onSelect: onSelectPayment,
              ),
              SizedBox(height: 16.h),
              PaymentOptionWidget(
                title: 'Cash On Delivery',
                icon: Icons.money,
                groupValue: selectedPayment,
                onSelect: onSelectPayment,
              ),
              SizedBox(height: 24.h),
              Container(
                decoration: BoxDecoration(
                  color: ColorManager.soLightGreyColor,
                  borderRadius: BorderRadius.circular(15.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Radio<String>(
                          activeColor: ColorManager.primaryColor,
                          value: 'Add New Credit/ Debit Card',
                          groupValue: selectedPayment,
                          onChanged: (value) => onSelectPayment(value!, true),
                        ),
                        SizedBox(width: 8.w),
                        Icon(Icons.credit_card, size: 24),
                        SizedBox(width: 12.w),
                        Text(
                          'Add New Credit/ Debit Card',
                          style: TextStyles.font16DeepGeyColorRegular,
                        ),
                      ],
                    ),
                    const CardFormWidget(),
                  ],
                ),
              ),
              SizedBox(height: 24.h),
            ],
          ),
        ),
      );
  }
}
