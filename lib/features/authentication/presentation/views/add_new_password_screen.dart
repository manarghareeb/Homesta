import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:homesta/core/routing/app_router.dart';
import 'package:homesta/core/theming/styles.dart';
import 'package:homesta/core/widgets/custom_button_widget.dart';
import 'package:homesta/core/widgets/custom_text_field_widget.dart';

class AddNewPasswordScreen extends StatefulWidget {
  const AddNewPasswordScreen({super.key});

  @override
  State<AddNewPasswordScreen> createState() => _AddNewPasswordScreenState();
}

class _AddNewPasswordScreenState extends State<AddNewPasswordScreen> {
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
                'Add a new Password',
                style: TextStyles.font24BlackColorW500,
              ),
              SizedBox(height: 8.h),
              Text(
                'The account has been recovered',
                style: TextStyles.font14GreyColorW400,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 56.h),
              CustomTextFieldWidget(
                controller: passwordController,
                hintText: '**********',
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
              CustomTextFieldWidget(
                controller: confirmPasswordController,
                hintText: 'Confirm Password',
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
                buttonText: 'Log In',
                onPressed: () {
                  GoRouter.of(context).push(AppRouter.verficationScreen);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
