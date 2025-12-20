import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/core/theming/styles.dart';
import 'package:homesta/core/widgets/custom_app_bar_widget.dart';
import 'package:homesta/core/widgets/custom_button_widget.dart';

class LogoutScreen extends StatelessWidget {
  const LogoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBarWidget(text: 'Logout'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
        child: Column(
          children: [
            Text(
              'If you logout you miss your data and your favorite product in wishlist.',
              style: TextStyles.font16BlackRegular,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24.h),
            CustomButtonWidget(
              buttonText: 'Continue Shopping',
              onPressed: () {},
            ),
            SizedBox(height: 24.h),
            CustomButtonWidget(
              buttonText: 'Logout',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LogoutConfirmScreen(),
                  ),
                );
              },
              isPrimary: false,
            ),
          ],
        ),
      ),
    );
  }
}

class LogoutConfirmScreen extends StatelessWidget {
  const LogoutConfirmScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBarWidget(text: 'Logout'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
        child: Column(
          children: [
            Text(
              'Are you sure you want to log out?',
              style: TextStyles.font16BlackRegular,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24.h),
            CustomButtonWidget(
              buttonText: 'Cancel',
              onPressed: () {},
              isPrimary: false,
            ),
            SizedBox(height: 24.h),
            CustomButtonWidget(buttonText: 'Logout', onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
