import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/core/theming/styles.dart';
import 'package:homesta/core/widgets/custom_app_bar_widget.dart';
import 'package:homesta/core/widgets/custom_button_widget.dart';
import 'package:homesta/features/account/presentation/widgets/customer_support_info_section.dart';
import 'package:homesta/features/account/presentation/widgets/fAQ_item_widget.dart';
import 'package:homesta/features/account/presentation/widgets/information_to_send_message_section.dart';

class CustomerSupportScreen extends StatefulWidget {
  const CustomerSupportScreen({super.key});

  @override
  State<CustomerSupportScreen> createState() => _CustomerSupportScreenState();
}

class _CustomerSupportScreenState extends State<CustomerSupportScreen> {
  final List<Map<String, String>> faqData = [
    {
      'question': 'How can I place an order?',
      'answer': 'You can place an order through our app or website easily.',
    },
    {
      'question': 'Do you offer customer support?',
      'answer': 'Yes, our customer support is available 24/7.',
    },
    {
      'question': 'Do you offer customer support?',
      'answer': 'Yes, our customer support is available 24/7.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBarWidget(text: ' Customer Support'),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomerSupportInfoSection(),
              SizedBox(height: 32),
              Text('Send Us a Message', style: TextStyles.font16BlackW500),
              SizedBox(height: 16.h),
              const InformationToSendMessageSection(),
              SizedBox(height: 24.h),
              CustomButtonWidget(buttonText: 'Send Message', onPressed: () {}),
              SizedBox(height: 32.h),
              Text(
                'Frequently Asked Questions',
                style: TextStyles.font20BlackColorW500,
              ),
              SizedBox(height: 16.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                child: Column(
                  children:
                      faqData.map((faq) {
                        return FAQItemWidget(
                          question: faq['question']!,
                          answer: faq['answer']!,
                        );
                      }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
