import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:homesta/core/routing/app_router.dart';
import 'package:homesta/core/theming/styles.dart';
import 'package:homesta/core/widgets/custom_button_widget.dart';
import 'package:homesta/core/widgets/custom_text_field_widget.dart';
import 'package:homesta/features/authentication/presentation/widgets/auth_navigation_text.dart';
import 'package:homesta/features/authentication/presentation/widgets/continue_with.dart';
import 'package:homesta/features/authentication/presentation/widgets/rememberme_forget_password.dart';
import 'package:homesta/features/authentication/presentation/widgets/social_media_button.dart';
import 'package:homesta/core/widgets/title_to_text_field.dart';

import '../../../../core/api/end_ponits.dart';
import '../../../../core/cache/cache_helper.dart';
import '../cubit/auth/auth_cubit.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 16.w, horizontal: 16.h),
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
              Text('Sign In', style: TextStyles.font24BlackColorW500),
              SizedBox(height: 8.h),
              Text(
                'Please fill your detail to access your account',
                style: TextStyles.font14GreyColorW400,
              ),
              SizedBox(height: 24.h),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    const TitleToTextField(title: 'Email'),
                    SizedBox(height: 8.h),
                    CustomTextFieldWidget(
                      suffixIcon: Icons.check,
                      controller: emailController,
                      hintText: 'User@gmail.com',
                      textInputType: TextInputType.emailAddress,
                      title: 'Enter Email',
                      prefixIcon: Icons.email_outlined,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your email";
                        } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                            .hasMatch(value)) {
                          return "Please enter a valid email address";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16.h),
                    const TitleToTextField(title: 'Password'),
                    SizedBox(height: 8.h),
                    CustomTextFieldWidget(
                      controller: passwordController,
                      hintText: 'Enter Password',
                      textInputType: TextInputType.text,
                      title: 'Enter Password',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Enter your password";
                        } else if (value.length < 8) {
                          return "Password must be at least 8 characters";
                        } else if (!RegExp(r'[A-Z]').hasMatch(value)) {
                          return "Password must contain at least one uppercase letter";
                        } else if (!RegExp(r'[a-z]').hasMatch(value)) {
                          return "Password must contain at least one lowercase letter";
                        } else if (!RegExp(r'[0-9]').hasMatch(value)) {
                          return "Password must contain at least one number";
                        } else if (!RegExp(r'[!@#\$&*~]').hasMatch(value)) {
                          return "Password must contain at least one special character";
                        }
                        return null;
                      },
                      obscureText: true,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8.h),
              const RememberMeAndForgetPassword(),
              SizedBox(height: 24.h),
              BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) async {
                  if (state is AuthSuccess) {
                    await CacheHelper().saveData(key: ApiKey.token, value: state.user.token);
                    await CacheHelper().saveData(key: ApiKey.id, value: state.user.user.id);
                    await CacheHelper().saveData(key: ApiKey.email, value: state.user.user.email);

                    // ✅ التعامل مع الأدوار
                    // if (state.user.user.isAdmin) {
                    //   GoRouter.of(context).push(AppRouter.adminDashboard);
                    // } else if (state.user.user.isSeller) {
                    //   GoRouter.of(context).push(AppRouter.sellerDashboard);
                    // } else {
                    //   GoRouter.of(context).push(AppRouter.homeScreen);
                    // }
                                      GoRouter.of(context).push(AppRouter.homeScreen);
                  } else if (state is AuthFailure) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.error)),
                    );
                  }
                },
                builder: (context, state) {
                  if (state is AuthLoading) {
                    return const CircularProgressIndicator();
                  }
                  return CustomButtonWidget(
                    buttonText: 'Sign In',
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        context.read<AuthCubit>().login(
                          emailController.text,
                          passwordController.text,
                        );
                      }
                    },
                  );
                },
              ),
              SizedBox(height: 16.h),
              const ContinueWith(),
              SizedBox(height: 16.h),
              const SocialMediaButton(),
              SizedBox(height: 16.h),
              AuthNavigationText(
                text: 'Don’t have an account?',
                textButton: ' Sign Up',
                onTap: () {
                  GoRouter.of(context).push(AppRouter.signUpScreen);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
