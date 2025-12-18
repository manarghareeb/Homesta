import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/theming/styles.dart';

class PaymentSuccessScreen extends StatelessWidget {
  const PaymentSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: ColorManager.blackColor),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: Text(
          'Payment',
          style: TextStyles.font16BlackRegular.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [
            SizedBox(height: 40.h),

            Icon(
              Icons.check_circle_outline,
              size: 100.w,
              color: ColorManager.greenColor,
            ),

            SizedBox(height: 16.h),

            Text(
              'PAYMENT SUCCESS',
              style: TextStyles.font16BlackRegular.copyWith(
                fontWeight: FontWeight.w600,
                letterSpacing: 0.8,
              ),
            ),

            SizedBox(height: 12.h),

            Container(
              height: 1,
              width: double.infinity,
              color: Colors.grey.shade300,
            ),

            SizedBox(height: 24.h),

            Container(
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.04),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 26.r,
                        backgroundImage: const AssetImage(
                          'assets/images/image 1.png',
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Maram Ahmed',
                            style: TextStyles.font14BlackColorW400.copyWith(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 6.h),
                          _infoRow(Icons.location_on_outlined, 'Cairo, Egypt'),
                          SizedBox(height: 4.h),
                          _infoRow(Icons.access_time, 'Nov 23 - 22:00'),
                        ],
                      ),
                    ],
                  ),

                  SizedBox(height: 16.h),

                  /// Chips
                  Row(
                    children: [
                      _chip('Adult/ A. Category/C Block'),
                      SizedBox(width: 8.w),
                      _chip('x1'),
                    ],
                  ),
                ],
              ),
            ),

            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 45.h,
              child: ElevatedButton(
                onPressed:
                    () => Navigator.popUntil(context, (route) => route.isFirst),
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorManager.primaryColor,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                ),
                child: const Text(
                  'Return to Home',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),

            SizedBox(height: 12.h),
            SizedBox(
              width: double.infinity,
              height: 45.h,
              child: OutlinedButton(
                onPressed:
                    () => Navigator.popUntil(context, (route) => route.isFirst),
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: ColorManager.primaryColor),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                ),
                child: const Text(
                  'Continue Shopping',
                  style: TextStyle(
                    color: ColorManager.primaryColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),

            SizedBox(height: 50.h),
          ],
        ),
      ),
    );
  }

  Widget _infoRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 14.w, color: Colors.black),
        SizedBox(width: 4.w),
        Text(
          text,
          style: TextStyles.font14BlackColorW400.copyWith(color: Colors.black),
        ),
      ],
    );
  }

  Widget _chip(String text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: ColorManager.greyColor.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Text(
        text,
        style: TextStyles.font14BlackColorW400.copyWith(
          fontSize: 12.sp,
          color: Colors.black,
        ),
      ),
    );
  }
}
