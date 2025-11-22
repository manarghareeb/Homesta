import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:homesta/core/routing/app_router.dart';
import 'package:homesta/core/theming/styles.dart';
import 'package:homesta/features/account/presentation/widgets/icon_text_button.dart';
import 'package:homesta/features/account/presentation/widgets/logout_and_cancel.dart';
import 'package:homesta/features/account/presentation/widgets/option_tile.dart';
import 'package:homesta/features/account/presentation/widgets/photo_profile.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        title: Text(
          'My Profile',
          style: TextStyles.font24ButtonColorW500.copyWith(fontSize: 20),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              GoRouter.of(context).push(AppRouter.editProfileScreen);
            },
            icon: Icon(Icons.edit),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const PhotoProfile(),
              SizedBox(height: 8.h),
              Text('Madison Smith', style: TextStyles.font16BlackRegular),
              Text('ID: 25030024', style: TextStyles.font16BlackRegular),
              SizedBox(height: 16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconTextButton(
                    icon: Icons.person_outlined,
                    label: 'Profile',
                    isActive: true,
                    onTap: () {},
                  ),
                  IconTextButton(
                    icon: Icons.favorite_border,
                    label: 'Wish list',
                    onTap: () {},
                  ),
                  IconTextButton(
                    icon: Icons.list_alt,
                    label: 'My order',
                    onTap: () {
                      GoRouter.of(context).push(AppRouter.myOrderScreen);
                    },
                  ),
                ],
              ),
              SizedBox(height: 24.h),
              OptionTile(
                icon: Icons.key,
                label: 'Privacy Policy',
                onTap: () {},
              ),
              OptionTile(
                icon: Icons.payment,
                label: 'Payment Methods',
                onTap: () {},
              ),
              OptionTile(
                icon: Icons.notifications_outlined,
                label: 'Notification',
                onTap: () {},
              ),
              OptionTile(
                icon: Icons.settings_outlined,
                label: 'Settings',
                onTap: () {},
              ),
              OptionTile(
                icon: Icons.help_outline,
                label: 'Help',
                onTap: () {
                  GoRouter.of(context).push(AppRouter.helpCenterScreen);
                },
              ),
              OptionTile(
                icon: Icons.logout,
                label: 'Logout',
                onTap: () {
                  bottomSheet(context);
                },
              ),
              SizedBox(height: 24.h),
            ],
          ),
        ),
      ),
    );
  }

  void bottomSheet(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      barrierColor: Color(0xFFB19470).withOpacity(0.6),
      context: context,
      builder: (BuildContext context) {
        return const LogOutAndCancel();
      },
    );
  }
}