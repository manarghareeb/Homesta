import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:homesta/core/routing/app_router.dart';
import 'package:homesta/core/theming/styles.dart';
import 'package:homesta/features/authentication/presentation/widgets/checkbox_widget.dart';

class RememberMeAndForgetPassword extends StatefulWidget {
  const RememberMeAndForgetPassword({super.key});

  @override
  State<RememberMeAndForgetPassword> createState() =>
      _RememberMeAndForgetPasswordState();
}

class _RememberMeAndForgetPasswordState
    extends State<RememberMeAndForgetPassword> {
  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CheckboxWidget(),
            Text('Remember me', style: TextStyles.font14BlackColorW400),
          ],
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
            'Forget Password?',
            style: TextStyles.font14PrimaryColorW400,
          ),
        ),
      ],
    );
  }
}
