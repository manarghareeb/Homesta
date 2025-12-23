import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/core/widgets/custom_text_field_widget.dart';
import 'package:homesta/core/widgets/title_to_text_field.dart';

class InformationToSendMessageSection extends StatefulWidget {
  const InformationToSendMessageSection({super.key});

  @override
  State<InformationToSendMessageSection> createState() =>
      _InformationToSendMessageSectionState();
}

class _InformationToSendMessageSectionState
    extends State<InformationToSendMessageSection> {
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
    return Column(
      children: [
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
      ],
    );
  }
}
