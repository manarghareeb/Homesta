import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/theming/styles.dart';
import 'package:homesta/core/widgets/custom_app_bar_widget.dart';
import 'package:homesta/core/widgets/custom_text_field_widget.dart';
import 'package:homesta/features/account/presentation/widgets/contact_info_section.dart';
import 'package:homesta/features/account/presentation/widgets/send_message_button.dart';
import 'package:homesta/features/authentication/presentation/widgets/title_to_text_field.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({super.key});

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController subjectController = TextEditingController();
  TextEditingController messageController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    subjectController.dispose();
    messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBarWidget(text: 'Contact Us'),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Get in Touch',
                style: TextStyles.font16BlackRegular.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                'Your email address will not be published. Required fields are marked*',
                style: TextStyles.font14GreyColorW400.copyWith(
                  color: ColorManager.deepGreyColor,
                ),
              ),
              SizedBox(height: 16.h),
              TitleToTextField(title: 'Your Name'),
              SizedBox(height: 8),
              CustomTextFieldWidget(
                controller: nameController,
                hintText: 'Maram Ahmed',
                textInputType: TextInputType.name,
                title: 'Maram Ahmed',
              ),
              SizedBox(height: 24.h),
              TitleToTextField(title: 'Email'),
              SizedBox(height: 8),
              CustomTextFieldWidget(
                controller: emailController,
                hintText: 'maramahmed@gmail.com',
                textInputType: TextInputType.name,
                title: '',
              ),
              SizedBox(height: 24.h),
              TitleToTextField(title: 'Subject'),
              SizedBox(height: 8),
              CustomTextFieldWidget(
                controller: subjectController,
                hintText: 'Enter Subject',
                textInputType: TextInputType.name,
                title: 'Enter Subject',
              ),
              SizedBox(height: 24.h),
              TitleToTextField(title: 'Your Message'),
              SizedBox(height: 8),
              CustomTextFieldWidget(
                controller: messageController,
                hintText: 'Enter here..',
                textInputType: TextInputType.text,
                title: 'Enter here..',
              ),
              SizedBox(height: 16.h),
              const SendMessageButton(),
              SizedBox(height: 24.h),
              const ContactInfoSection()
            ],
          ),
        ),
      ),
    );
  }
}