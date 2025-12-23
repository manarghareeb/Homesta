import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:homesta/core/routing/app_router.dart';
import 'package:homesta/core/theming/styles.dart';
import 'package:homesta/core/widgets/custom_button_widget.dart';
import 'package:homesta/core/widgets/custom_text_field_widget.dart';
import 'package:homesta/features/authentication/presentation/widgets/auth_navigation_text.dart';
import 'package:homesta/core/widgets/title_to_text_field.dart';

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
                'Don’t worry , we’ll send you reset instructions.',
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
                  } else if (value.contains("@gmail.com") == false) {
                    return 'this email is not valid "missing @gmail.com"';
                  }
                  return null;
                },
              ),
              SizedBox(height: 32.h),
              CustomButtonWidget(
                buttonText: 'Submit',
                onPressed: () {
                  GoRouter.of(context).push(AppRouter.addNewPasswordScreen);
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
    );
  }
}
