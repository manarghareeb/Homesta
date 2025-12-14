import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/theming/styles.dart';
import 'package:homesta/core/widgets/custom_app_bar_widget.dart';

class NotificationEmptyScreen extends StatelessWidget {
  const NotificationEmptyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarWidget(
        text: 'Notification',
        backgroundColor: Colors.white,
        textColor: ColorManager.blackColor,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ✅ استبدال الأيقونة بصورة من الأصول
            Image.asset(
              'assets/images/notification_icon.png',
              width: 151.w,
              height: 149.w,
              color: Color(0xFFF0F3FF), // لو بدك تلونها
            ),
            SizedBox(height: 10.h),
            Image.asset(
              'assets/images/notification_icon_alt.png',
              width: 44.13.w,
              height: 12.47.w,
              color: Color(0xFFF0F3FF), // لو بدك تلونها
            ),
            SizedBox(height: 20.h),
            Text(
              'No notifications yet',
              style: TextStyles.font20BlackColorW500,
            ),
            SizedBox(height: 8.h),
            Text(
              'Get your home ready step by step,and \nwe’ll keep you updated with all offers and news.',
              textAlign: TextAlign.center,
              style: TextStyles.font16GreyRegular,
            ),
          ],
        ),
      ),
    );
  }
}
