import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:homesta/core/routing/app_router.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/theming/styles.dart';
import 'package:homesta/core/widgets/custom_button_widget.dart';
import 'package:homesta/features/authentication/presentation/widgets/auth_navigation_text.dart';
import 'package:homesta/features/authentication/presentation/widgets/title_to_text_field.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  TextEditingController codeController = TextEditingController();
  String currentCode = "";

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
              Text('Verify Code', style: TextStyles.font24BlackColorW500),
              SizedBox(height: 8.h),
              Text(
                'Please enter the code we just sent to email',
                style: TextStyles.font14GreyColorW400,
                textAlign: TextAlign.center,
              ),
              Text(
                'example@gmail.com', 
                style: TextStyles.font14MainColorW400.copyWith(
                  color: ColorManager.primaryColor
                ),
              ),
              SizedBox(height: 56.h),
              TitleToTextField(title: 'Code'),
              SizedBox(height: 8.h),
              PinCodeTextField(
                appContext: context,
                length: 6,
                controller: codeController,
                keyboardType: TextInputType.number,
                animationType: AnimationType.fade,
                //cursorColor: ColorManager.primaryColor,
                enableActiveFill: true,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.circle,
                  fieldHeight: 40.h,
                  fieldWidth: 40.w,
                  inactiveFillColor: Colors.white,
                  activeFillColor: Colors.white,
                  selectedFillColor: Colors.white,
                  inactiveColor: ColorManager.lightGreyColor,
                  activeColor: ColorManager.lightGreyColor,
                  selectedColor: ColorManager.lightGreyColor,
                  borderWidth: 2,
                ),
                textStyle: TextStyles.font16WhiteW500.copyWith(
                  color: ColorManager.blackColor
                ),
                beforeTextPaste: (text) => false,
                onChanged: (value) {
                  setState(() {
                    currentCode = value;
                  });
                },
                onCompleted: (value) {
                  currentCode = value;
                },
                pastedTextStyle: TextStyle(),
                hintCharacter: '-',
                hintStyle: TextStyles.font16WhiteW500.copyWith(
                  color: ColorManager.blackColor
                ),
              ),
              SizedBox(height: 32.h),
              CustomButtonWidget(
                buttonText: 'Verify',
                onPressed: () {
                  GoRouter.of(context).push(AppRouter.setNewPasswordScreen);
                },
              ),
              SizedBox(height: 16.h),
              AuthNavigationText(
                text: 'Didn’t receive code?',
                textButton: ' Resend Code',
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}