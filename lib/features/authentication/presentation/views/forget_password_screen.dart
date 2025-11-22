import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/core/theming/styles.dart';
import 'package:homesta/core/widgets/custom_button_widget.dart';
import 'package:homesta/core/widgets/custom_text_field_widget.dart';

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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Reset password', style: TextStyles.font24ButtonColorW500,),
              SizedBox(height: 8.h,),
              Text(
                'Please enter yor Email to receive  a link to create a new password via Email',
                style: TextStyles.font16GreyRegular,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40.h),
              CustomTextFieldWidget(
                prefixIcon: Icon(Icons.email_outlined),
                controller: controller,
                hintText: 'Enter your email',
                textInputType: TextInputType.emailAddress,
                title: 'Enter your email',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your Email';
                  } else if (value.contains("@gmail.com") == false) {
                    return 'this email is not valid "missing @gmail.com"';
                  }
                  return null;
                },
              ),
              SizedBox(height: 60.h),
              CustomButtonWidget(
                buttonText: 'Send Reset Email',
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    /*try {
                      await FirebaseAuth.instance.sendPasswordResetEmail(
                        email: controller.text.trim(),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'Password reset email sent! Check your inbox.',
                          ),
                        ),
                      );
                      GoRouter.of(context).push(AppRouter.loginScreen);
                    } on FirebaseAuthException catch (e) {
                      String message = 'Something went wrong';
                      if (e.code == 'user-not-found') {
                        message = 'No user found for that email';
                      }
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(SnackBar(content: Text(message)));
                    }*/
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}