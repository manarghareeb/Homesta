import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:homesta/core/routing/app_router.dart';
import 'package:homesta/core/theming/styles.dart';

class AlreadyHaveAccount extends StatelessWidget {
  const AlreadyHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Already have a account?',
          style: TextStyles.font16GreyRegular
        ),
        TextButton(
          onPressed: () {
            GoRouter.of(context).push(AppRouter.loginScreen);
          },
          child: Text(
            'Login',
            style: TextStyles.font24ButtonColorW500.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w400
            )
          ),
        ),
      ],
    );
  }
}