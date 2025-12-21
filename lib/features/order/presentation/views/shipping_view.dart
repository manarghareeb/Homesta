import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/core/theming/styles.dart';
import 'package:homesta/core/widgets/custom_button_widget.dart';
import 'package:homesta/core/widgets/custom_text_field_widget.dart';
import 'package:homesta/features/account/presentation/widgets/selected_country.dart';
import 'package:homesta/features/authentication/presentation/widgets/title_to_text_field.dart';

class ShippingView extends StatefulWidget {
  final VoidCallback onNext;
  final VoidCallback onBack;
  const ShippingView({super.key, required this.onNext, required this.onBack});

  @override
  State<ShippingView> createState() => _ShippingViewState();
}

class _ShippingViewState extends State<ShippingView> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController zipCodeController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController countryController = TextEditingController();

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    addressController.dispose();
    zipCodeController.dispose();
    cityController.dispose();
    countryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            children: [
              Icon(Icons.arrow_downward_outlined),
              SizedBox(width: 8.w),
              Text('Delivery Address', style: TextStyles.font16BlackW500),
            ],
          ),
          SizedBox(height: 24.h),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TitleToTextField(
                      title: 'First Name', 
                    ),
                    SizedBox(height: 8.h),
                    CustomTextFieldWidget(
                      controller: firstNameController,
                      hintText: 'Maram',
                      textInputType: TextInputType.name,
                      title: '',
                    ),
                  ],
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TitleToTextField(
                      title: 'Last Name', 
                    ),
                    SizedBox(height: 8.h),
                    CustomTextFieldWidget(
                      controller: lastNameController,
                      hintText: 'Elamly',
                      textInputType: TextInputType.name,
                      title: '',
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          TitleToTextField(
            title: 'Email', 
          ),
          SizedBox(height: 8.h),
          CustomTextFieldWidget(
            controller: emailController,
            hintText: 'maramahmed@gmail.com',
            textInputType: TextInputType.emailAddress,
            title: '',
          ),
          SizedBox(height: 16.h),
          TitleToTextField(
            title: 'Phone', 
          ),
          SizedBox(height: 8.h),
          CustomTextFieldWidget(
            controller: phoneController,
            hintText: '12345678901',
            textInputType: TextInputType.phone,
            title: '',
          ),
          SizedBox(height: 16.h),
          TitleToTextField(
            title: 'Address', 
          ),
          SizedBox(height: 8.h),
          CustomTextFieldWidget(
            controller: addressController,
            hintText: 'Nasr City',
            textInputType: TextInputType.streetAddress,
            title: '',
          ),
          SizedBox(height: 16.h),
          TitleToTextField(
            title: 'Zip Code', 
          ),
          SizedBox(height: 8.h),
          CustomTextFieldWidget(
            controller: zipCodeController,
            hintText: '23451678',
            textInputType: TextInputType.phone,
            title: '',
          ),
          SizedBox(height: 16.h),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TitleToTextField(
                      title: 'City', 
                    ),
                    SizedBox(height: 8.h),
                    CustomTextFieldWidget(
                      controller: cityController,
                      hintText: 'Giza',
                      textInputType: TextInputType.streetAddress,
                      title: '',
                    ),
                  ],
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: const SelectedCountry(),
              ),
            ],
          ),
          SizedBox(height: 24.h,),
          CustomButtonWidget(
            buttonText: 'Continue to Payment', 
            onPressed: widget.onNext
          )
        ],
      ),
    );
  }
}
