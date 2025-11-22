import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/theming/styles.dart';
import 'package:homesta/core/widgets/custom_app_bar_widget.dart';
import 'package:homesta/features/account/presentation/widgets/gender_selector.dart';
import 'package:homesta/features/account/presentation/widgets/text_and_text_field.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController birthDateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBarWidget(text: 'My Profile'),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 80.r,
                backgroundColor: ColorManager.mainColor,
              ),
              SizedBox(height: 8.h),
              Text('Madison Smith', style: TextStyles.font16BlackRegular),
              Text('ID: 25030024', style: TextStyles.font16BlackRegular),
              SizedBox(height: 16.h),
              TextAndTextField(
                controller: nameController,
                hintText: 'Full Name',
                textInputType: TextInputType.name,
                text: 'Full Name',
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
              TextAndTextField(
                controller: birthDateController,
                hintText: 'Date of birth',
                textInputType: TextInputType.datetime,
                text: 'Date of birth',
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
              const GenderSelector(),
              SizedBox(height: 40.h,),
            ],
          ),
        ),
      ),
    );
  }
}
