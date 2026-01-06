import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/core/widgets/custom_app_bar_widget.dart';
import 'package:homesta/features/account/presentation/widgets/fAQ_item_widget.dart';
import 'package:homesta/features/account/presentation/widgets/fAQs_category_selector.dart';

class FAQsScreen extends StatefulWidget {
  const FAQsScreen({super.key});

  @override
  State<FAQsScreen> createState() => _FAQsScreenState();
}

class _FAQsScreenState extends State<FAQsScreen> {
  int? selectedCategoryIndex;

  final Map<String, List<Map<String, String>>> faqData = {
    'General Information': [
      {
        'question': 'How can I place an order?',
        'answer': 'You can place an order through our app or website easily.',
      },
      {
        'question': 'Do you offer customer support?',
        'answer': 'Yes, our customer support is available 24/7.',
      },
    ],
    'Ordering & Shipping': [
      {
        'question': 'Can I track my order?',
        'answer': 'Yes, you will receive a tracking link once shipped.',
      },
    ],
    'Payments & Discounts': [
      {
        'question': 'What payment methods do you accept?',
        'answer': 'We accept Visa, MasterCard, and PayPal.',
      },
    ],
    'Account & Profile': [
      {
        'question': 'Can I track my order?',
        'answer': 'Yes, you will receive a tracking link once shipped.',
      },
    ],
    'Returns & Exchanges': [
      {
        'question': 'Can I track my order?',
        'answer': 'Yes, you will receive a tracking link once shipped.',
      },
    ],
  };

  @override
  Widget build(BuildContext context) {
    final categories = faqData.keys.toList();
    final selectedCategory =
        selectedCategoryIndex != null
            ? categories[selectedCategoryIndex!]
            : null;

    final questions =
        selectedCategory != null ? faqData[selectedCategory]! : [];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBarWidget(text: 'FAQs'),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 32.h, horizontal: 16.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              FAQCategorySelector(
                categories: categories,
                onCategorySelected: (index) {
                  setState(() {
                    selectedCategoryIndex = index;
                  });
                },
              ),
              SizedBox(height: 24.h),
              ...questions.map(
                (q) => FAQItemWidget(
                  question: q['question']!,
                  answer: q['answer']!,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
