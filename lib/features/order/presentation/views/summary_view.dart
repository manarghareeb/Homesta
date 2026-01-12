import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/theming/styles.dart';
import 'package:homesta/features/cart/presentation/views/cart_view.dart';
import 'package:homesta/features/home/presentation/views/home.dart';
import 'package:homesta/features/order/data/models/payment_response/payment_response.dart';
import '../../../../core/routing/app_router.dart';

class SummaryView extends StatelessWidget {
  final VoidCallback onNext;
  final VoidCallback onBack;
  final PaymentResponse paymentResponse;
  const SummaryView({super.key, required this.onNext, required this.onBack, required this.paymentResponse});

  @override
  Widget build(BuildContext context) {
    final order = paymentResponse.success;
    return Align(
      alignment: Alignment.topCenter,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.arrow_downward_outlined),
                SizedBox(width: 8.w),
                Text('Order Summary', style: TextStyles.font16BlackW500),
              ],
            ),
            SizedBox(height: 16.h),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 24.w),
              decoration: BoxDecoration(
                color: ColorManager.aliceBlue,
                borderRadius: BorderRadius.circular(15.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Shipping Address'),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        color: ColorManager.greyColor,
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        order.address,
                        style: TextStyles.font14GreyColorW400,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 24.h),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 24.w),
              decoration: BoxDecoration(
                color: ColorManager.aliceBlue,
                borderRadius: BorderRadius.circular(15.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Payment Method', style: TextStyles.font16BlackW500),
                  SizedBox(height: 8.h),
                  Text(
                    order.paymentMethod,
                    style: TextStyles.font14GreyColorW400,
                  ),
                ],
              ),
            ),
            SizedBox(height: 24.h),
            Text('Order Items (${order.items.length})', style: TextStyles.font16BlackW500),
            SizedBox(height: 16.h),
            CartView(
              buttonText: 'Place Order',
              onNext: (){}
            ),
            SizedBox(height: 24.h),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      GoRouter.of(context).push(AppRouter.sellerScreen);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorManager.thirdColor,
                      padding: EdgeInsets.symmetric(vertical: 14.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                    ),
                    child: Text(
                      'Chat with seller',
                      style: TextStyles.font14WhiteColorW400,
                    ),
                  ),
                ),
                SizedBox(width: 16.w),
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomeView(),
                        ),
                        (route) => false,
                      );
                    },
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 14.h),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: ColorManager.primaryColor),
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    ),
                    child: Text(
                      'Back to home',
                      style: TextStyles.font14PrimaryColorW400,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
