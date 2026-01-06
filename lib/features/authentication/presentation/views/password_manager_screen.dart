import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:homesta/core/routing/app_router.dart';
import 'package:homesta/core/theming/styles.dart';
import 'package:homesta/core/widgets/custom_app_bar_widget.dart';
import 'package:homesta/core/widgets/custom_button_widget.dart';
import 'package:homesta/core/widgets/custom_text_field_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/auth/auth_cubit.dart';

class PasswordManagerScreen extends StatefulWidget {
  const PasswordManagerScreen({super.key});

  @override
  State<PasswordManagerScreen> createState() => _PasswordManagerScreenState();
}

class _PasswordManagerScreenState extends State<PasswordManagerScreen> {
  final confirmPasswordController = TextEditingController();
  final currentPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    confirmPasswordController.dispose();
    currentPasswordController.dispose();
    newPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBarWidget(text: "Password Manager"),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Current Password
              _buildLabel("Current Password", required: true),
              CustomTextFieldWidget(
                controller: currentPasswordController,
                hintText: "Enter Current Password",
                textInputType: TextInputType.text,
                obscureText: true,
                title: '',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Enter your current password";
                  } else if (value.length < 8) {
                    return "Password must be at least 8 characters";
                  }
                  return null;
                },
              ),
              SizedBox(height: 8.h),

              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    GoRouter.of(context).push(AppRouter.forgetPasswordScreen);
                  },
                  child: Text(
                    "Forget Password?",
                    style: TextStyles.font16PrimaryColorW400Underline.copyWith(
                      fontSize: 14.sp,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16.h),

              /// New Password
              _buildLabel("New Password", required: true),
              CustomTextFieldWidget(
                controller: newPasswordController,
                hintText: "Enter New Password",
                textInputType: TextInputType.text,
                obscureText: true,
                title: '',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Enter new password";
                  } else if (value.length < 8) {
                    return "Password must be at least 8 characters";
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.h),

              /// Confirm New Password
              _buildLabel("Confirm New Password", required: true),
              CustomTextFieldWidget(
                controller: confirmPasswordController,
                hintText: "Confirm New Password",
                textInputType: TextInputType.text,
                obscureText: true,
                title: '',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Confirm your password";
                  } else if (value.length < 8) {
                    return "Password must be at least 8 characters";
                  } else if (value != newPasswordController.text) {
                    return "Passwords do not match";
                  }
                  return null;
                },
              ),
              SizedBox(height: 30.h),

              /// Update Button with BlocConsumer
              BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is ChangePasswordSuccess) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.response.message)),
                    );
                    GoRouter.of(context).push(AppRouter.loginScreen);
                  } else if (state is AuthFailure) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.error)),
                    );
                  }
                },
                builder: (context, state) {
                  if (state is AuthLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return CustomButtonWidget(
                    buttonText: "Update Password",
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        context.read<AuthCubit>().changePassword(
                          confirmPasswordController.text,
                          currentPasswordController.text,
                          newPasswordController.text,
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
    );
  }

  /// Label مع نجمة إذا Required
  Widget _buildLabel(String text, {bool required = true}) {
    return Padding(
      padding: EdgeInsets.only(bottom: 6.h),
      child: RichText(
        text: TextSpan(
          text: text,
          style: TextStyles.font16BlackRegular,
          children: required
              ? [
            TextSpan(
              text: " *",
              style: TextStyles.font14BlackColorW400.copyWith(
                color: Colors.red,
              ),
            ),
          ]
              : [],
        ),
      ),
    );
  }
}
