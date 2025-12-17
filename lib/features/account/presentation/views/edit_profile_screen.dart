import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/widgets/custom_app_bar_widget.dart';
import 'package:homesta/core/widgets/custom_button_widget.dart';
import 'package:homesta/features/account/presentation/widgets/gender_and_birthday_selector.dart';
import 'package:homesta/features/account/presentation/widgets/photo_profile.dart';
import 'package:homesta/features/account/presentation/widgets/selected_country.dart';
import 'package:homesta/features/account/presentation/widgets/text_and_text_field.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController birthDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBarWidget(
        text: 'Edit Profile',
        textColor: ColorManager.blackColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const PhotoProfile(),
              SizedBox(height: 24.h),
              TextAndTextField(
                controller: firstNameController,
                hintText: 'Maram',
                textInputType: TextInputType.name,
                textLabel: 'First Name',
              ),
              TextAndTextField(
                controller: lastNameController,
                hintText: 'Elamly',
                textInputType: TextInputType.name,
                textLabel: 'Last Name',
              ),
              TextAndTextField(
                controller: emailController,
                hintText: 'manarahmed@gmail.com',
                textInputType: TextInputType.emailAddress,
                textLabel: 'Email',
              ),
              TextAndTextField(
                controller: phoneController,
                hintText: '0806 123 7890',
                textInputType: TextInputType.phone,
                textLabel: 'Mobile Number',
              ),
              SizedBox(height: 8.h),
              const GenderAndBirthdaySelector(),
              SizedBox(height: 16.h),
              const SelectedCountry(),
              SizedBox(height: 16.h),
              TextAndTextField(
                controller: emailController,
                hintText: '123 Main Street, Spring',
                textInputType: TextInputType.emailAddress,
                textLabel: 'Address',
              ),
              SizedBox(height: 16.h),
              TextAndTextField(
                controller: emailController,
                hintText: '09021',
                textInputType: TextInputType.emailAddress,
                textLabel: 'Zip Code',
              ),
              SizedBox(height: 32.h),
              CustomButtonWidget(buttonText: 'Save Changes', onPressed: () {}),
              SizedBox(height: 40.h),
            ],
          ),
        ),
      ),
    );
  }
}
