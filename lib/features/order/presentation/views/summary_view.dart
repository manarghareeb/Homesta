import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/theming/styles.dart';
import 'package:homesta/core/widgets/custom_button_widget.dart';
import 'package:homesta/features/order/presentation/widgets/order_summary_in_checkout.dart';
import 'package:homesta/features/cart/presentation/widgets/your_card_item.dart';

class SummaryView extends StatelessWidget {
  final VoidCallback onNext;
  final VoidCallback onBack;
  const SummaryView({super.key, required this.onNext, required this.onBack});

  @override
  Widget build(BuildContext context) {
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
                      Icon(Icons.location_on_outlined, color: ColorManager.greyColor,),
                      SizedBox(width: 4.w,),
                      Text(
                        'Nasr City, Cairo - Egypt',
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
                    'Credit Card (Mastercard **** 1425)',
                    style: TextStyles.font14GreyColorW400,
                  ),
                ],
              ),
            ),
            SizedBox(height: 24.h),
            Text('Order Items (4)', style: TextStyles.font16BlackW500),
            SizedBox(height: 16.h),
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 4,
              separatorBuilder: (context, index) =>
                  Divider(color: ColorManager.lightGreyColor),
              itemBuilder: (context, index) => const YourCardItem(),
            ),
            SizedBox(height: 24.h),
            Container(
              padding: EdgeInsets.all(24.h),
              decoration: BoxDecoration(
                color: ColorManager.aliceBlue,
                borderRadius: BorderRadius.circular(15.r),
              ),
              child: Column(
                children: [
                  const OrderSummaryInCheckout(),
                  SizedBox(height: 24.h),
                  CustomButtonWidget(
                    buttonText: 'Place Order',
                    onPressed: onNext,
                  ),
                ],
              ),
            ),
            SizedBox(height: 24.h),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: onBack,
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
