import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:homesta/core/routing/app_router.dart';
import 'package:homesta/core/theming/styles.dart';

class CreateNewAccount extends StatelessWidget {
  const CreateNewAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Don’t have an account?',
          style: TextStyles.font16GreyRegular,
        ),
        TextButton(
          onPressed: () {
            GoRouter.of(context).push(AppRouter.signUpScreen);
          },
          child: Text(
            'Sign Up',
            style: TextStyles.font24ButtonColorW500.copyWith(fontSize: 16.sp),
          ),
        ),
      ],
    );
  }
}