import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:homesta/core/routing/app_router.dart';
import 'package:homesta/core/theming/styles.dart';
import 'package:homesta/core/widgets/custom_button_widget.dart';
import 'package:homesta/core/widgets/custom_text_field_widget.dart';
import 'package:homesta/core/widgets/title_to_text_field.dart';

class SetNewPasswordScreen extends StatefulWidget {
  const SetNewPasswordScreen({super.key});

  @override
  State<SetNewPasswordScreen> createState() => _SetNewPasswordScreenState();
}

class _SetNewPasswordScreenState extends State<SetNewPasswordScreen> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {
                      GoRouter.of(context).pop();
                    },
                    icon: Icon(Icons.arrow_back_ios, size: 16.sp),
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              Text(
                'Set New Password',
                style: TextStyles.font24BlackColorW500,
              ),
              SizedBox(height: 8.h),
              Text(
                'Must be at least 8 character',
                style: TextStyles.font14GreyColorW400,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 56.h),
              TitleToTextField(title: 'Password'),
              SizedBox(height: 8.h,),
              CustomTextFieldWidget(
                controller: passwordController,
                hintText: 'Enter Password',
                textInputType: TextInputType.text,
                title: 'Enter Password',
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Enter your password";
                  } else if (value.length < 8) {
                    return "Password must be at least 8 characters";
                  }
                  return null;
                },
                obscureText: true,
              ),
              SizedBox(height: 16.h),
              TitleToTextField(title: 'Confirm Password'),
              SizedBox(height: 8.h,),
              CustomTextFieldWidget(
                controller: confirmPasswordController,
                hintText: 'Enter Password',
                textInputType: TextInputType.text,
                title: 'Enter Password',
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Enter your password";
                  } else if (value.length < 8) {
                    return "Password must be at least 8 characters";
                  }
                  return null;
                },
                obscureText: true,
              ),
              SizedBox(height: 32.h),
              CustomButtonWidget(
                buttonText: 'Reset Password',
                onPressed: () {
                  GoRouter.of(context).push(AppRouter.loginScreen);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}