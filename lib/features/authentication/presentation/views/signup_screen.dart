import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:homesta/core/routing/app_router.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/theming/styles.dart';
import 'package:homesta/core/widgets/custom_button_widget.dart';
import 'package:homesta/core/widgets/custom_text_field_widget.dart';
import 'package:homesta/features/authentication/presentation/widgets/already_have_account.dart';
import 'package:homesta/features/authentication/presentation/widgets/arrow_back_widget.dart';
import 'package:homesta/features/authentication/presentation/widgets/continue_with.dart';
import 'package:homesta/features/authentication/presentation/widgets/social_media_button.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 30.w, horizontal: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const ArrowBackWidget(),
              SizedBox(height: 30.h),
              Text('Register', style: TextStyles.font24ButtonColorW500),
              Text(
                'Create your New account',
                style: TextStyles.font16GreyRegular.copyWith(fontSize: 13.sp),
              ),
              SizedBox(height: 40.h),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    CustomTextFieldWidget(
                      controller: nameController,
                      hintText: 'Full Name',
                      textInputType: TextInputType.name,
                      title: 'Full Name',
                      prefixIcon: Icon(
                        Icons.person_outline,
                        color: ColorManager.iconTextFieldColor,
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter your full name";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16.h),
                    CustomTextFieldWidget(
                      controller: emailController,
                      hintText: 'Email',
                      textInputType: TextInputType.emailAddress,
                      title: 'Email',
                      prefixIcon: Icon(
                        Icons.email_outlined,
                        color: ColorManager.iconTextFieldColor,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your Email';
                        } else if (value.contains("@gmail.com") == false) {
                          return 'this email is not valid "missing @gmail.com"';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16.h),
                    CustomTextFieldWidget(
                      controller: passwordController,
                      hintText: 'Password',
                      textInputType: TextInputType.text,
                      title: 'Password',
                      prefixIcon: Icon(
                        Icons.lock_outline,
                        color: ColorManager.iconTextFieldColor,
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter your password";
                        } else if (value.length < 6) {
                          return "Password must be at least 6 characters";
                        }
                        return null;
                      },
                      obscureText: true,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24.h),
              CustomButtonWidget(
                buttonText: 'Sign up',
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    GoRouter.of(context).push(AppRouter.loginScreen);
                  }
                },
              ),
              SizedBox(height: 40.h),
              const ContinueWith(),
              SizedBox(height: 16.h),
              const SocialMediaButton(),
              SizedBox(height: 35.h),
              const AlreadyHaveAccount(),
            ],
          ),
        ),
      ),
    );
  }
}
