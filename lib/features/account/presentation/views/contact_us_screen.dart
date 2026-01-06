import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/theming/styles.dart';
import 'package:homesta/core/widgets/custom_app_bar_widget.dart';
import 'package:homesta/features/account/presentation/widgets/contact_info_section.dart';
import 'package:homesta/features/account/presentation/widgets/information_to_send_message_section.dart';
import 'package:homesta/features/account/presentation/widgets/send_message_button.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({super.key});

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
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
              const InformationToSendMessageSection(),
              SizedBox(height: 16.h),
              const SendMessageButton(),
              SizedBox(height: 24.h),
              const ContactInfoSection(),
            ],
          ),
        ),
      ),
    );
  }
}
