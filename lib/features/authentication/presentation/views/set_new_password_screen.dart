import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:homesta/core/routing/app_router.dart';
import 'package:homesta/core/theming/styles.dart';
import 'package:homesta/core/widgets/custom_button_widget.dart';
import 'package:homesta/core/widgets/custom_text_field_widget.dart';
import 'package:homesta/core/widgets/title_to_text_field.dart';
import 'package:homesta/features/authentication/presentation/cubit/auth/auth_cubit.dart';

class SetNewPasswordScreen extends StatefulWidget {
  const SetNewPasswordScreen({super.key, this.email});

  final String? email;

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
          child: Form(
            key: formKey,
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
                  'Must be at least 8 characters',
                  style: TextStyles.font14GreyColorW400,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 56.h),

                /// Password
                TitleToTextField(title: 'Password'),
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
                SizedBox(height: 16.h),

                /// Confirm Password
                TitleToTextField(title: 'Confirm Password'),
                SizedBox(height: 8.h),
                CustomTextFieldWidget(
                  controller: confirmPasswordController,
                  hintText: 'Confirm Password',
                  textInputType: TextInputType.text,
                  title: 'Confirm Password',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Confirm your password";
                    } else if (value != passwordController.text) {
                      return "Passwords do not match";
                    }
                    return null;
                  },
                  obscureText: true,
                ),
                SizedBox(height: 32.h),

                BlocConsumer<AuthCubit, AuthState>(
                  listener: (context, state) {
                    if (state is ResetPasswordSuccess) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(state.response.message)),
                      );

                      Future.delayed(const Duration(seconds: 1), () {
                        GoRouter.of(context).push(AppRouter.loginScreen);
                      });
                    } else if (state is AuthFailure) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Reset failed: ${state.error}")),
                      );
                    }
                  },
                  builder: (context, state) {
                    if (state is AuthLoading) {
                      return const CircularProgressIndicator();
                    }
                    return CustomButtonWidget(
                      buttonText: 'Reset Password',
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          context.read<AuthCubit>().resetPassword(
                            widget.email ?? "",
                            passwordController.text,
                          );
                        }
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}