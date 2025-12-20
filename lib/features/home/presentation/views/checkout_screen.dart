import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:homesta/core/routing/app_router.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/theming/styles.dart';
import 'package:homesta/core/widgets/custom_app_bar_widget.dart';
import 'package:homesta/core/widgets/custom_button_widget.dart';
import 'package:homesta/features/home/presentation/widgets/order_summary_in_checkout.dart';
import 'package:homesta/features/home/presentation/widgets/payment_method_selector.dart';
import 'package:homesta/features/home/presentation/widgets/your_card_item.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBarWidget(
        text: 'Checkout',
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            left: 16.w,
            right: 16.w,
            top: 16.h,
            bottom: 24.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    color: ColorManager.primaryColor,
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    'Deliver to Giza, Egy....',
                    style: TextStyles.font14GreyColorW400,
                  ),
                  SizedBox(width: 8.w),
                  Icon(
                    Icons.keyboard_arrow_down,
                    color: ColorManager.blackColor,
                  ),
                ],
              ),
              SizedBox(height: 24.h),
              Text(
                'Your Cart (4 items)',
                style: TextStyles.font20BlackColorW500.copyWith(
                  fontWeight: FontWeight.w400,
                ),
              ),
              ListView.separated(
                padding: EdgeInsets.symmetric(vertical: 16.h),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 4,
                separatorBuilder:
                    (context, index) =>
                        Divider(color: ColorManager.lightGreyColor),
                itemBuilder: (context, index) {
                  return YourCardItem();
                },
              ),
              SizedBox(height: 16.h),
              Text('Payment Method', style: TextStyles.font20BlackColorW500),
              SizedBox(height: 24.h),
              const PaymentMethodSelector(),
              SizedBox(height: 24.h),
              Container(
                padding: EdgeInsets.all(24.h),
                decoration: BoxDecoration(
                  color: ColorManager.aliceBlue,
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Column(
                  children: [
                    const OrderSummaryInCheckout(),
                    SizedBox(height: 24.h),
                    CustomButtonWidget(
                      buttonText: 'Place Order',
                      onPressed: () {
                        GoRouter.of(
                          context,
                        ).push(AppRouter.paymentMethodScreen);
                      },
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      'By placing your order, you agree to our terms and conditions',
                      style: TextStyles.font14GreyColorW400,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
