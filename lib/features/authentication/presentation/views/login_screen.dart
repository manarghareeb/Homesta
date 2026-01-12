import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:homesta/core/api/api_keys.dart';

import 'package:homesta/core/cache/cache_helper.dart';
import 'package:homesta/core/routing/app_router.dart';
import 'package:homesta/core/theming/styles.dart';
import 'package:homesta/core/widgets/custom_button_widget.dart';
import 'package:homesta/core/widgets/custom_text_field_widget.dart';
import 'package:homesta/core/widgets/title_to_text_field.dart';

import 'package:homesta/features/authentication/presentation/cubit/auth/auth_cubit.dart';
import 'package:homesta/features/authentication/presentation/widgets/auth_navigation_text.dart';
import 'package:homesta/features/authentication/presentation/widgets/continue_with.dart';
import 'package:homesta/features/authentication/presentation/widgets/rememberme_forget_password.dart';
import 'package:homesta/features/authentication/presentation/widgets/social_media_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
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
      body: LayoutBuilder(
        builder: (context, constraints) {
          final maxWidth = constraints.maxWidth > 500 ? 420.0 : double.infinity;

          return SingleChildScrollView(
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: maxWidth),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 24.h,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: IconButton(
                          icon: Icon(Icons.arrow_back_ios, size: 18.sp),
                          onPressed: () => GoRouter.of(context).pop(),
                        ),
                      ),

                      SizedBox(height: 16.h),

                      Text('Sign In', style: TextStyles.font24BlackColorW500),
                      SizedBox(height: 8.h),
                      Text(
                        'Please fill your detail to access your account',
                        style: TextStyles.font14GreyColorW400,
                        textAlign: TextAlign.center,
                      ),

                      SizedBox(height: 32.h),

                      Form(
                        key: formKey,
                        child: Column(
                          children: [
                            const TitleToTextField(title: 'Email'),
                            SizedBox(height: 8.h),
                            CustomTextFieldWidget(
                              controller: emailController,
                              hintText: 'User@gmail.com',
                              title: 'Enter Email',
                              prefixIcon: Icons.email_outlined,
                              textInputType: TextInputType.emailAddress,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your email';
                                } else if (!RegExp(
                                  r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                                ).hasMatch(value)) {
                                  return 'Invalid email format';
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
                              title: 'Enter Password',
                              obscureText: true,
                              textInputType: TextInputType.text,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Enter your password';
                                } else if (value.length < 8) {
                                  return 'Password must be at least 8 characters';
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 12.h),
                      const RememberMeAndForgetPassword(),

                      SizedBox(height: 24.h),

                      BlocConsumer<AuthCubit, AuthState>(
                        listener: (context, state) async {
                          if (state is AuthSuccess) {
                            await CacheHelper().saveData(
                              key: ApiKeys.token,
                              value: state.user.token,
                            );
                            await CacheHelper().saveData(
                              key: ApiKeys.id,
                              value: state.user.user.id,
                            );
                            await CacheHelper().saveData(
                              key: ApiKeys.email,
                              value: state.user.user.email,
                            );

                            GoRouter.of(context).push(AppRouter.crateStoreScreen);
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
                                  emailController.text.trim(),
                                  passwordController.text.trim(),
                                );
                              }
                            },
                          );
                        },
                      ),

                      SizedBox(height: 20.h),
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
            ),
          );
        },
      ),
    );
  }
}
