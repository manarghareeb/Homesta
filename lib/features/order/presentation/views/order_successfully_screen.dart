import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:homesta/core/routing/app_router.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/theming/styles.dart';
import 'package:homesta/core/widgets/custom_button_widget.dart';

class OrderSuccessfullyScreen extends StatelessWidget {
  const OrderSuccessfullyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(24.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.check_circle, color: Color(0xFF40D164), size: 120.sp),
              SizedBox(height: 20.h),
              Text(
                'Order Placed Successfully!',
                style: TextStyles.font24BlackColorW500,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 8.h),
              Text(
                'Your Order has been confirmed, it will be delivered soon.',
                style: TextStyles.font16GreyRegular,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 32.h),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.r),
                  color: ColorManager.aliceBlue,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Order Number',
                          style: TextStyles.font16GreyRegular,
                        ),
                        Text(
                          '#46406',
                          style: TextStyles.font16WhiteW500.copyWith(
                            color: ColorManager.primaryColor,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.h),
                    Divider(color: ColorManager.greyColor),
                    SizedBox(height: 16.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Estimated Delivery',
                          style: TextStyles.font16GreyRegular,
                        ),
                        Text(
                          '3-5 Business Days',
                          style: TextStyles.font16WhiteW500.copyWith(
                            color: ColorManager.primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('🎉', style: TextStyle(fontSize: 25.sp)),
                  SizedBox(height: 24.h),
                  Text('   📦   ', style: TextStyle(fontSize: 25.sp)),
                  SizedBox(height: 24.h),
                  Text('🚚', style: TextStyle(fontSize: 25.sp)),
                ],
              ),
              SizedBox(height: 24.h),
              CustomButtonWidget(buttonText: 'Back to home', onPressed: () {}),
              SizedBox(height: 16.h),
              CustomButtonWidget(
                buttonText: 'Track Order',
                onPressed: () {
                  GoRouter.of(context).push(AppRouter.trackOrder);
                },
                isPrimary: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
