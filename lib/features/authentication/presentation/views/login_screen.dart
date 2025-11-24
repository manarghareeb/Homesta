import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:homesta/core/routing/app_router.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/theming/styles.dart';
import 'package:homesta/core/widgets/custom_button_widget.dart';
import 'package:homesta/core/widgets/custom_text_field_widget.dart';
import 'package:homesta/features/authentication/presentation/widgets/arrow_back_widget.dart';
import 'package:homesta/features/authentication/presentation/widgets/create_new_account.dart';
import 'package:homesta/features/authentication/presentation/widgets/rememberme_forget_password.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Opacity(
            opacity: 0.8,
            child: Image.asset('assets/images/login.jpg', fit: BoxFit.cover),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 30.w, horizontal: 16.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const ArrowBackWidget(),
                  SizedBox(height: 200.h),
                  Text('Welcome Back', style: TextStyles.font24ButtonColorW500),
                  Text(
                    'Log in to your account',
                    style: TextStyles.font16GreyRegular.copyWith(
                      fontSize: 15.sp,
                    ),
                  ),
                  SizedBox(height: 32.h),
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
                            if (value == null || value.isEmpty) {
                              return 'Please enter your Email';
                            } else if (!value.contains("@gmail.com")) {
                              return 'This email is not valid "missing @gmail.com"';
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
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Enter your password";
                            } else if (value.length < 6) {
                              return "Password must be at least 6 characters";
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 8.h),
                  const RememberMeAndForgetPassword(),
                  SizedBox(height: 48.h),
                  CustomButtonWidget(
                    buttonText: 'Log in',
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        GoRouter.of(context).push(AppRouter.signUpScreen);
                      }
                    },
                  ),
                  SizedBox(height: 16.h),
                  const CreateNewAccount(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
