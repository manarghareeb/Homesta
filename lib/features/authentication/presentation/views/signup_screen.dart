import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:homesta/core/routing/app_router.dart';
import 'package:homesta/core/theming/styles.dart';
import 'package:homesta/core/widgets/custom_button_widget.dart';
import 'package:homesta/core/widgets/custom_text_field_widget.dart';
import 'package:homesta/features/authentication/presentation/widgets/agree_terms_and_privacy.dart';
import 'package:homesta/features/authentication/presentation/widgets/auth_navigation_text.dart';
import 'package:homesta/features/authentication/presentation/widgets/continue_with.dart';
import 'package:homesta/features/authentication/presentation/widgets/social_media_button.dart';
import 'package:homesta/core/widgets/title_to_text_field.dart';

import '../cubit/auth/auth_cubit.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isChecked = false;

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
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
              Text('Sign Up', style: TextStyles.font24BlackColorW500),
              SizedBox(height: 8.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 52.5.w),
                child: Text(
                  'Fill your information below or register with your social account.',
                  style: TextStyles.font14GreyColorW400,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 24.h),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    const TitleToTextField(title: 'First Name'),
                    SizedBox(height: 8.h),
                    CustomTextFieldWidget(
                      controller: firstNameController,
                      hintText: 'Enter First Name',
                      textInputType: TextInputType.name,
                      title: 'Enter First Name',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your first name";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 24.h),
                    const TitleToTextField(title: 'Last Name'),
                    SizedBox(height: 8.h),
                    CustomTextFieldWidget(
                      controller: lastNameController,
                      hintText: 'Enter Last Name',
                      textInputType: TextInputType.name,
                      title: 'Enter Last Name',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your last name";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 24.h),
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
                          return 'Please enter your Email';
                        } else if (!RegExp(
                          r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                        ).hasMatch(value)) {
                          return 'Please enter a valid email address';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 24.h),
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
              Row(
                children: [
                  Checkbox(
                    value: isChecked,
                    onChanged: (value) {
                      setState(() {
                        isChecked = value ?? false;
                      });
                    },
                  ),
                  const AgreeTermsAndPrivacy(),
                ],
              ),
              SizedBox(height: 24.h),
              BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is RegisterSuccess) {
                    showDialog(
                      context: context,
                      builder:
                          (_) => AlertDialog(
                            backgroundColor: Colors.white,
                            title: const Text("Check your email"),
                            content: const Text(
                              "Your account has been created successfully.\n"
                              "Please check your email and confirm your account before logging in.",
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  GoRouter.of(
                                    context,
                                  ).push(AppRouter.loginScreen);
                                },
                                child: const Text("OK"),
                              ),
                            ],
                          ),
                    );
                  } else if (state is AuthFailure) {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text(state.error)));
                  }
                },
                builder: (context, state) {
                  if (state is AuthLoading) {
                    return const CircularProgressIndicator();
                  }
                  return CustomButtonWidget(
                    buttonText: 'Sign Up',
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        if (!isChecked) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("You must agree to the terms"),
                            ),
                          );
                          return;
                        }
                        context.read<AuthCubit>().register(
                          firstNameController.text,
                          lastNameController.text,
                          emailController.text,
                          passwordController.text,
                          isChecked,
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
                text: 'Already have an account?',
                textButton: ' Sign In',
                onTap: () {
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
