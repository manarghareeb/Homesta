import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/widgets/custom_app_bar_widget.dart';
import 'package:homesta/features/cart/presentation/views/cart_view.dart';
import 'package:homesta/features/order/data/models/payment_response/payment_response.dart';
import 'package:homesta/features/order/presentation/cubit/shipping_cubit/shipping_cubit.dart';
import 'package:homesta/features/order/presentation/cubit/shipping_cubit/shipping_state.dart';
import 'package:homesta/features/order/presentation/views/payment_view.dart';
import 'package:homesta/features/order/presentation/views/shipping_view.dart';
import 'package:homesta/features/order/presentation/views/summary_view.dart';

class OrderFlowScreen extends StatefulWidget {
  const OrderFlowScreen({super.key});

  @override
  State<OrderFlowScreen> createState() => _OrderFlowScreenState();
}

class _OrderFlowScreenState extends State<OrderFlowScreen> {
  int currentStep = 0;
  int? shippingOrderId;
  PaymentResponse? paymentResponse;

  final List<String> steps = ["Cart", "Shipping", "Payment", "Summary"];

  final List<IconData> iconSteps = [
    Icons.shopping_cart_outlined,
    Icons.local_shipping_outlined,
    Icons.payment,
    Icons.summarize_outlined,
  ];

  final List<String> appBarTitles = [
    "Checkout",
    "Shipping",
    "Payment",
    "Summary",
  ];

  List<Widget> get screens => [
    CartView(onNext: () => setState(() => currentStep++)),
    BlocConsumer<ShippingCubit, ShippingState>(
      listener: (context, state) {
        if (state is ShippingSuccess) {
          shippingOrderId = state.response;
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Shipping info saved successfully!')),
          );
          setState(() => currentStep++);
        } else if (state is ShippingFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.error)));
        }
      },
      builder: (context, state) {
        if (state is ShippingLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        return ShippingView(
          onBack: () => setState(() => currentStep--),
          onNext: (shippingData) {
            context.read<ShippingCubit>().addShipping(shippingData);
          },
        );
      },
    ),
    if (shippingOrderId != null)
      PaymentView(
        orderId: shippingOrderId!,
        onBack: () => setState(() => currentStep--),
        onNext: (PaymentResponse response) {
          setState(() {
            paymentResponse = response;
            currentStep++;
          });
        },
      )
    else
      const SizedBox.shrink(),
    if (paymentResponse != null)
      SummaryView(
        paymentResponse: paymentResponse!,
        onBack: () => setState(() => currentStep--),
        //onNext: () {}
      )
    else
      const SizedBox.shrink(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBarWidget(text: appBarTitles[currentStep]),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
        child: Column(
          children: [
            SizedBox(
              height: 70.h,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(steps.length, (index) {
                      bool isActive = index == currentStep;
                      bool isCompleted = index < currentStep;
                      final Color stepColor =
                          (isActive || isCompleted)
                              ? ColorManager.primaryColor
                              : ColorManager.lightGreyColor;
                      return Expanded(
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 18.r,
                              backgroundColor: stepColor,
                              child: Text(
                                '${index + 1}',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            if (index != steps.length - 1) ...[
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.symmetric(horizontal: 4.w),
                                  height: 2.h,
                                  color:
                                      index < currentStep
                                          ? ColorManager.primaryColor
                                          : ColorManager.lightGreyColor,
                                ),
                              ),
                            ],
                          ],
                        ),
                      );
                    }),
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(steps.length, (index) {
                      bool isActive = index == currentStep;
                      bool isCompleted = index < currentStep;
                      final Color stepColor =
                          (isActive || isCompleted)
                              ? ColorManager.primaryColor
                              : ColorManager.lightGreyColor;
                      return Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(iconSteps[index], color: stepColor, size: 18.sp),
                          SizedBox(width: 4.w),
                          Text(
                            steps[index],
                            style: TextStyle(
                              fontSize: 13.sp,
                              fontWeight:
                                  (isActive || isCompleted)
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                              color: stepColor,
                            ),
                          ),
                        ],
                      );
                    }),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24.h),
            Expanded(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: screens[currentStep],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
