import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/widgets/custom_app_bar_widget.dart';
import '../../../../core/widgets/custom_text_field_widget.dart';
import '../widgets/help_category_widget.dart';
import '../widgets/option_tile.dart';
import '../widgets/support_option_widget.dart';

class HelpCenterScreen extends StatelessWidget {
  const HelpCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBarWidget(text: "Help Center"),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Search Bar
            CustomTextFieldWidget(
              controller: TextEditingController(),
              hintText: "Search for help articles....",
              textInputType: TextInputType.text,
              title: '',
              prefixIcon: Icons.search,
            ),
            SizedBox(height: 24.h),

            /// Categories
            Text("Browse by Category", style: TextStyles.font18BlackW500),
            SizedBox(height: 16.h),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              childAspectRatio: 1.0, // ✅ التعديل هنا فقط
              children: const [
                HelpCategoryWidget(
                  imagePath: "assets/images/book.png",
                  title: "Getting Started",
                  description: "Learn the basics and set up your account",
                ),
                HelpCategoryWidget(
                  imagePath: "assets/images/credit.png",
                  title: "Billing & Payments",
                  description: "Manage subscriptions and payment methods",
                ),
                HelpCategoryWidget(
                  imagePath: "assets/images/privacy.png",
                  title: "Security & Privacy",
                  description: "Keep your account safe and secure",
                ),
                HelpCategoryWidget(
                  imagePath: "assets/images/setting.png",
                  title: "Account Setup",
                  description: "Customize your profile and preferences",
                ),
                HelpCategoryWidget(
                  imagePath: "assets/images/team.png",
                  title: "Team Management",
                  description: "Collaborate with your team members",
                ),
                HelpCategoryWidget(
                  imagePath: "assets/images/headphone.png",
                  title: "Technical Support",
                  description: "Troubleshooting and technical issues",
                ),
              ],
            ),
            SizedBox(height: 24.h),

            /// Topics
            OptionTile(
              colorBorder: const Color(0xffF6F6F6),
              backgroundColor: const Color(0xffF6F6F6),
              imagePath: "assets/images/outline.png",
              label: "How to create your first account",
              subtitle: "Getting Started • 2.5k views • 3 min",
              onTap: () {},
            ),
            OptionTile(
              colorBorder: const Color(0xffF6F6F6),
              backgroundColor: const Color(0xffF6F6F6),
              imagePath: "assets/images/outline.png",
              label: "Understanding your billing cycle",
              subtitle: "Billing & Payments • 1.8k views • 5 min",
              onTap: () {},
            ),
            OptionTile(
              colorBorder: const Color(0xffF6F6F6),
              backgroundColor: const Color(0xffF6F6F6),
              imagePath: "assets/images/outline.png",
              label: "Setting up two-factor authentication",
              subtitle: "Security & Privacy • 3.2k views • 4 min",
              onTap: () {},
            ),
            OptionTile(
              colorBorder: const Color(0xffF6F6F6),
              backgroundColor: const Color(0xffF6F6F6),
              imagePath: "assets/images/outline.png",
              label: "How to reset your password",
              subtitle: "Account Settings • 4.1k views • 2 min",
              onTap: () {},
            ),
            OptionTile(
              colorBorder: const Color(0xffF6F6F6),
              backgroundColor: const Color(0xffF6F6F6),
              imagePath: "assets/images/outline.png",
              label: "Inviting team members to your workspace",
              subtitle: "Team Management • 1.5k views • 4 min",
              onTap: () {},
            ),
            OptionTile(
              colorBorder: const Color(0xffF6F6F6),
              backgroundColor: const Color(0xffF6F6F6),
              imagePath: "assets/images/outline.png",
              label: "Troubleshooting connection issues",
              subtitle: "Technical Support • 2.9k views • 2 min",
              onTap: () {},
            ),
            SizedBox(height: 24.h),

            /// Support Options
            Align(
              alignment: Alignment.center,
              child: Text(
                "Still Need Help?",
                style: TextStyles.font18BlackW500,
              ),
            ),
            SizedBox(height: 12.h),
            const SupportOptionWidget(
              title: "Email Support",
              description: "We'll respond as soon as possible",
              buttonText: "Send Email",
              imagePath: "assets/images/email.png",
              color: Color(0xff608B9B),
            ),
            SizedBox(height: 12.h),
            const SupportOptionWidget(
              title: "Chat AI",
              description: "Get instant answers and assistance",
              buttonText: "Start Chat",
              imagePath: "assets/images/chat.png",
              color: Color(0xff609466),
            ),
            SizedBox(height: 12.h),
            const SupportOptionWidget(
              title: "Phone Support",
              description: "Speak to a support representative",
              buttonText: "Call Now",
              imagePath: "assets/images/phone.png",
              color: Color(0xff876BA3),
            ),
          ],
        ),
      ),
    );
  }
}
