import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/theming/styles.dart';
import 'package:homesta/core/widgets/custom_app_bar_widget.dart';
import 'package:homesta/features/account/presentation/widgets/gender_selector.dart';
import 'package:homesta/features/account/presentation/widgets/photo_profile.dart';
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
                hintText: 'Fist Name',
                textInputType: TextInputType.name,
                text: 'First Name',
              ),
              TextAndTextField(
                controller: lastNameController,
                hintText: 'Last Name',
                textInputType: TextInputType.name,
                text: 'Last Name',
              ),
              TextAndTextField(
                controller: emailController,
                hintText: 'Email',
                textInputType: TextInputType.emailAddress,
                text: 'Email',
              ),
              TextAndTextField(
                controller: phoneController,
                hintText: 'Mobile Number',
                textInputType: TextInputType.phone,
                text: 'Mobile Number',
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Gender',
                    style: TextStyles.font18BlackW500.copyWith(fontSize: 16.sp),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
              SizedBox(height: 8.h),
              const GenderSelector(),
              SizedBox(height: 16.h),
              TextAndTextField(
                controller: emailController,
                hintText: 'Tax Identification Number',
                textInputType: TextInputType.emailAddress,
                text: 'Tax Identification Number',
              ),
              TextAndTextField(
                controller: emailController,
                hintText: 'Tax Identification Country',
                textInputType: TextInputType.emailAddress,
                text: 'Tax Identification Country',
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'ID',
                    style: TextStyles.font18BlackW500.copyWith(fontSize: 16.sp),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
              SizedBox(height: 8.h),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  hintStyle: TextStyles.font16GreyRegular,
                  hintText: '1559 000 7788 8DER',
                  filled: true,
                  fillColor: ColorManager.lightGreyColor.withOpacity(0.5),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              TextAndTextField(
                controller: emailController,
                hintText: 'Ib street orogun ibadan',
                textInputType: TextInputType.emailAddress,
                text: 'Residential Address',
              ),
              SizedBox(height: 40.h),
            ],
          ),
        ),
      ),
    );
  }
}
