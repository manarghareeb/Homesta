import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:homesta/core/routing/app_router.dart';
import 'package:homesta/core/theming/styles.dart';
import 'package:homesta/core/widgets/custom_button_widget.dart';
import 'package:homesta/core/widgets/custom_text_field_widget.dart';
import 'package:homesta/features/authentication/presentation/widgets/auth_navigation_text.dart';
import 'package:homesta/core/widgets/title_to_text_field.dart';

import '../cubit/auth/auth_cubit.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final TextEditingController controller = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    controller.dispose();
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
                Text('Forget Password?', style: TextStyles.font24BlackColorW500),
                SizedBox(height: 8.h),
                Text(
                  'Don’t worry, we’ll send you reset instructions.',
                  style: TextStyles.font14GreyColorW400,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 56.h),
                TitleToTextField(title: 'Email'),
                SizedBox(height: 8.h),
                CustomTextFieldWidget(
                  suffixIcon: Icons.check,
                  controller: controller,
                  hintText: 'User@gmail.com',
                  textInputType: TextInputType.emailAddress,
                  title: 'Enter Email',
                  prefixIcon: Icons.email_outlined,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Email';
                    } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                        .hasMatch(value)) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 32.h),
                BlocConsumer<AuthCubit, AuthState>(
                  listener: (context, state) {
                    if (state is ForgetPasswordSuccess) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(state.response.message)),
                      );
                      GoRouter.of(context).push(
                        AppRouter.verficationScreen,
                        extra: controller.text,
                      );
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
                      buttonText: 'Submit',
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          context.read<AuthCubit>().forgetPassword(controller.text);
                        }
                      },
                    );
                  },
                ),
                SizedBox(height: 16.h),
                AuthNavigationText(
                  text: 'Remember Password?',
                  textButton: ' Sign In',
                  onTap: () {
                    GoRouter.of(context).push(AppRouter.loginScreen);
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
