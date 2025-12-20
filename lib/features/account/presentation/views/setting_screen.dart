import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:homesta/core/routing/app_router.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/theming/styles.dart';
import 'package:homesta/core/widgets/custom_app_bar_widget.dart';
import 'package:homesta/features/account/presentation/widgets/about_section_item.dart';
import 'package:homesta/features/account/presentation/widgets/option_tile.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool lightNotifications = true;
  bool lightLocation = true;
  bool lightDarkMode = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBarWidget(text: 'Setting'),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              OptionTile(
                icon: Icons.notifications_outlined,
                label: 'Notifications',
                onTap: () {},
                trailing: Switch(
                  activeThumbColor: ColorManager.greenColor,
                  value: lightNotifications,
                  onChanged: (bool value) {
                    setState(() {
                      lightNotifications = value;
                    });
                  },
                ),
              ),
              OptionTile(
                icon: Icons.location_on_outlined,
                label: 'Location Services',
                onTap: () {},
                trailing: Switch(
                  activeThumbColor: ColorManager.greenColor,
                  value: lightLocation,
                  onChanged: (bool value) {
                    setState(() {
                      lightLocation = value;
                    });
                  },
                ),
              ),
              OptionTile(
                icon: Icons.dark_mode_outlined,
                label: 'Dark Mode',
                onTap: () {},
                trailing: Switch(
                  activeThumbColor: ColorManager.greenColor,
                  value: lightDarkMode,
                  onChanged: (bool value) {
                    setState(() {
                      lightDarkMode = value;
                    });
                  },
                ),
              ),
              OptionTile(
                icon: Icons.language,
                label: 'Language',
                onTap: () {},
              ),
              OptionTile(
                icon: FontAwesomeIcons.mapLocationDot,
                label: 'Manage Address',
                onTap: () {},
              ),
              OptionTile(
                icon: Icons.support_agent_outlined,
                label: 'Customer Support',
                onTap: () {
                  GoRouter.of(context).push(AppRouter.customerSupportScreen);
                },
              ),
              OptionTile(
                icon: FontAwesomeIcons.comments,
                label: 'FAQs',
                onTap: () {
                  GoRouter.of(context).push(AppRouter.fAQsScreen);
                },
              ),
              OptionTile(
                icon: FontAwesomeIcons.addressBook,
                label: 'Contact Us',
                onTap: () {
                  GoRouter.of(context).push(AppRouter.contactUsScreen);
                },
              ),
              OptionTile(
                icon: FontAwesomeIcons.circleQuestion,
                label: 'Help Center',
                onTap: () {},
              ),
              OptionTile(
                icon: Icons.privacy_tip_outlined,
                label: 'Privacy & Security',
                onTap: () {
                  GoRouter.of(context).push(AppRouter.privacyPolicyScreen);
                },
              ),
              Text('About', style: TextStyles.font20BlackColorW500),
              SizedBox(height: 16.h),
              const AboutSectionItem(text: 'Terms of Service',),
              SizedBox(height: 16.h),
              const AboutSectionItem(text: 'App Version 1.0.0',),
            ],
          ),
        ),
      ),
    );
  }
}
