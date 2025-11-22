import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:homesta/core/routing/app_router.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/theming/styles.dart';

class RememberMeAndForgetPassword extends StatefulWidget {
  const RememberMeAndForgetPassword({super.key});

  @override
  State<RememberMeAndForgetPassword> createState() =>
      _RememberMeAndForgetPasswordState();
}

class _RememberMeAndForgetPasswordState extends State<RememberMeAndForgetPassword> {
  bool rememberMe = false; 

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: rememberMe,
          shape: const CircleBorder(),
          activeColor: ColorManager.buttonColor,
          onChanged: (value) {
            setState(() {
              rememberMe = value!;
            });
          },
        ),
        Text(
          'Remember me',
          style: TextStyles.font16GreyRegular,
        ),
        const Spacer(),
        TextButton(
          onPressed: () {
            GoRouter.of(context).push(AppRouter.forgetPasswordScreen);
          },
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            minimumSize: const Size(0, 0),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            splashFactory: NoSplash.splashFactory,
            foregroundColor: Colors.transparent,
          ),
          clipBehavior: Clip.none,
          child: Text(
            'Forget Password',
            style: TextStyles.font24ButtonColorW500.copyWith(
              fontSize: 15.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
