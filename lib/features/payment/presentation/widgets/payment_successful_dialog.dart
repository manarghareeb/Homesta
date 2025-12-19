import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:homesta/core/theming/styles.dart';
import 'package:homesta/core/widgets/custom_button_widget.dart';

class PaymentSuccessfulDialog extends StatelessWidget {
  const PaymentSuccessfulDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset('assets/images/correct_icon.svg'),
            SizedBox(height: 24.h),
            Text(
              'Payment Successful!',
              style: TextStyles.font16BlackRegular.copyWith(
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8.h),
            Text(
              'Your payment has been completed successfully!',
              style: TextStyles.font14GreyColorW400,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 32.h),
            CustomButtonWidget(
              buttonText: 'Done',
              onPressed: () {
                GoRouter.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
