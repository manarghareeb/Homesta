import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:homesta/core/routing/app_router.dart';
import 'package:homesta/core/theming/styles.dart';
import 'package:homesta/core/widgets/custom_app_bar_widget.dart';
import 'package:homesta/core/widgets/custom_button_widget.dart';
import 'package:homesta/core/widgets/custom_text_field_widget.dart';
import 'package:homesta/core/widgets/title_to_text_field.dart';

class TrackYourOrderScreen extends StatefulWidget {
  const TrackYourOrderScreen({super.key});

  @override
  State<TrackYourOrderScreen> createState() => _TrackYourOrderScreenState();
}

class _TrackYourOrderScreenState extends State<TrackYourOrderScreen> {
  TextEditingController orderIDController = TextEditingController();
  TextEditingController billingEmailController = TextEditingController();

  @override
  void dispose() {
    orderIDController.dispose();
    billingEmailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBarWidget(text: 'Track Your Order'),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Column(
            children: [
              Text(
                'To track your order please enter your Order ID in the box below and press the "Track Order" button. This was given to you on your receipt and in the confirmation email you should have received.',
                style: TextStyles.font14deepGreyColorW400,
              ),
              SizedBox(height: 32.h),
              TitleToTextField(title: 'Order ID'),
              SizedBox(height: 8.h),
              CustomTextFieldWidget(
                controller: orderIDController,
                hintText: 'Enter Your Order ID',
                textInputType: TextInputType.text,
                title: 'Enter Your Order ID',
              ),
              SizedBox(height: 16.h),
              TitleToTextField(title: 'Billing Email'),
              SizedBox(height: 8.h),
              CustomTextFieldWidget(
                controller: billingEmailController,
                hintText: 'Enter Email Address',
                textInputType: TextInputType.emailAddress,
                title: 'Enter Email Address',
              ),
              SizedBox(height: 32.h),
              CustomButtonWidget(
                buttonText: 'Track Order',
                onPressed: () {
                  GoRouter.of(context).push(AppRouter.trackOrderDetails);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
