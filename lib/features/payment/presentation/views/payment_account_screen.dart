import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/theming/styles.dart';
import 'package:homesta/core/widgets/custom_app_bar_widget.dart';
import 'package:homesta/features/payment/presentation/widgets/card_form_widget.dart';
import 'package:homesta/features/payment/presentation/widgets/payment_option_widget.dart';

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
      body: const PaymentWidget(),
    );
  }
}

class PaymentWidget extends StatefulWidget {
  const PaymentWidget({super.key});

  @override
  State<PaymentWidget> createState() => _PaymentWidgetState();
}

class _PaymentWidgetState extends State<PaymentWidget> {
  String selectedPayment = '';

  void onSelectPayment(String title) {
    setState(() {
      if (selectedPayment == title) {
        selectedPayment = '';
      } else {
        selectedPayment = title;
      }
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
              onSelect: (title, _) => onSelectPayment(title),
            ),
            SizedBox(height: 16.h),
            PaymentOptionWidget(
              title: 'Google Pay',
              icon: Icons.account_balance_wallet,
              groupValue: selectedPayment,
              onSelect: (title, _) => onSelectPayment(title),
            ),
            SizedBox(height: 16.h),
            PaymentOptionWidget(
              title: 'Cash On Delivery',
              icon: Icons.money,
              groupValue: selectedPayment,
              onSelect: (title, _) => onSelectPayment(title),
            ),
            SizedBox(height: 16.h),
            GestureDetector(
              onTap: () => onSelectPayment('Add New Credit/ Debit Card'),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                decoration: BoxDecoration(
                  color:
                      selectedPayment == 'Add New Credit/ Debit Card'
                          ? ColorManager.soLightGreyColor
                          : Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.r), 
                    topRight: Radius.circular(15.r),
                    bottomLeft: selectedPayment == 'Add New Credit/ Debit Card'
                    ? Radius.zero
                    : Radius.circular(15.r),
                    bottomRight: selectedPayment == 'Add New Credit/ Debit Card'
                    ? Radius.zero
                    : Radius.circular(15.r),
                  ),
                  border: Border.all(
                    color:
                        selectedPayment == 'Add New Credit/ Debit Card'
                            ? Colors.transparent
                            : ColorManager.greyColor,
                    width: 1.5,
                  ),
                ),
                child: Row(
                  children: [
                    Radio<String>(
                      value: 'Add New Credit/ Debit Card',
                      groupValue: selectedPayment,
                      activeColor: ColorManager.primaryColor,
                      onChanged: (value) {
                        setState(() {
                          selectedPayment = value!;
                        });
                      },
                    ),
                    Icon(
                      Icons.credit_card,
                      color: ColorManager.primaryColor,
                      size: 26,
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: Text(
                        'Add New Credit/ Debit Card',
                        style: selectedPayment == 'Add New Credit/ Debit Card' 
                        ? TextStyles.font16BlackRegular
                        : TextStyles.font16DeepGeyColorRegular,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child:
                  selectedPayment == 'Add New Credit/ Debit Card'
                      ? const CardFormWidget()
                      : const SizedBox.shrink(),
            ),
            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }
}
