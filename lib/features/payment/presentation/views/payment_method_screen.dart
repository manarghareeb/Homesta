import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/theming/styles.dart';
import 'package:homesta/core/widgets/custom_app_bar_widget.dart';
import 'package:homesta/features/home/presentation/widgets/order_summary_in_checkout.dart';
import 'package:homesta/features/payment/presentation/widgets/app_bar_actions.dart';
import 'package:homesta/features/payment/presentation/widgets/payment_action_buttons.dart';
import 'package:homesta/features/payment/presentation/widgets/payment_checkbox.dart';
import 'package:homesta/features/payment/presentation/widgets/payment_options_section.dart';
import 'package:homesta/features/payment/presentation/widgets/payment_successful_dialog.dart';
import 'package:homesta/features/payment/presentation/widgets/ticket_info_section.dart';
import 'package:homesta/features/payment/presentation/widgets/user_info_section.dart';

class PaymentMethodScreen extends StatefulWidget {
  const PaymentMethodScreen({super.key});

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  bool acceptTerms = false;
  bool requireInvoice = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBarWidget(
        text: 'Checkout',
        actions: [
          const AppBarActions(),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const UserInfoSection(),
              SizedBox(height: 10),
              const TicketInfoSection(),
              SizedBox(height: 16.h),
              Divider(color: ColorManager.greyColor),
              SizedBox(height: 16.h),
              Text(
                'Payment Method',
                style: TextStyles.font16BlackRegular.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 16.h),
              const PaymentOptionsSection(),
              SizedBox(height: 24.h),
              PaymentCheckboxRow(
                value: acceptTerms,
                onChanged: (v) => setState(() => acceptTerms = v),
                richText: TextSpan(
                  text: 'I have read the ',
                  children: [
                    TextSpan(
                      text:
                          'preliminary information conditions and the distance sales agreement.',
                      style: TextStyles.font14PrimaryColorW400,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8.h),
              PaymentCheckboxRow(
                value: requireInvoice,
                onChanged: (v) => setState(() => requireInvoice = v),
                text: 'I require a corporate invoice.',
                textStyle: TextStyles.font16BlackRegular,
              ),
              SizedBox(height: 32.h),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  border: Border.all(color: ColorManager.lightGreyColor),
                ),
                child: const OrderSummaryInCheckout(),
              ),
              SizedBox(height: 24.h),
              PaymentActionButtons(
                leftText: 'Back to Card',
                rightText: 'Complete Payment',
                onLeftPressed: () {},
                onRightPressed: () {
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (context) {
                      return PaymentSuccessfulDialog();
                    },
                  );
                },
              ),
              SizedBox(height: 24.h),
              Row(
                children: [
                  Icon(Icons.lock_outline, color: ColorManager.greyColor),
                  Expanded(
                    child: Text(
                      'Your payment information is encrypted and secure',
                      style: TextStyles.font14GreyColorW400,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

