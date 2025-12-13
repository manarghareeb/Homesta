import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:homesta/core/routing/app_router.dart';
import 'package:homesta/core/theming/styles.dart';
import 'package:homesta/features/account/presentation/widgets/logout_and_cancel.dart';
import 'package:homesta/features/account/presentation/widgets/name_and_edit_profile_section.dart';
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
          style: TextStyles.font18BlackW500.copyWith(fontSize: 20.sp),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
            
            },
            icon: Icon(Icons.settings_outlined, size: 24.w),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const PhotoProfile(),
                  SizedBox(width: 24.w),
                  const NameAndEditProfileSection(),
                ],
              ),
              SizedBox(height: 24.h),
              OptionTile(
                icon: Icons.list_alt,
                label: 'My order',
                onTap: () {},
              ),
              OptionTile(
                icon: Icons.favorite_border,
                label: 'collections',
                onTap: () {},
              ),
              OptionTile(
                icon: Icons.language_outlined,
                label: 'Language',
                onTap: () {},
              ),
              OptionTile(
                icon: Icons.notifications_outlined,
                label: 'Notification',
                onTap: () {
                  GoRouter.of(context).push(AppRouter.notificationScreen);
                },
              ),
              OptionTile(
                icon: Icons.lock_outline,
                label: 'Password',
                onTap: () {},
              ),
              OptionTile(
                icon: Icons.receipt_long_outlined,
                label: 'Taxes',
                onTap: () {},
              ),
              OptionTile(
                icon: Icons.account_balance_wallet_outlined,
                label: 'Fund wallet',
                onTap: () {},
              ),
              OptionTile(
                icon: Icons.swap_horiz,
                label: 'Transactions',
                onTap: () {},
              ),
              OptionTile(
                icon: Icons.payment,
                label: 'Payment',
                onTap: () {
                  GoRouter.of(context).push(AppRouter.checkoutScreen);
                },
              ),
              OptionTile(
                icon: Icons.accessibility_new_outlined,
                label: 'Accessibility',
                onTap: () {},
              ),
              OptionTile(
                icon: Icons.help_outline,
                label: 'Help Center',
                onTap: () {
                  GoRouter.of(context).push(AppRouter.helpCenterScreen);
                },
              ),
              SizedBox(height: 40.h),
              const Divider(),
              SizedBox(height: 8.h),
              OptionTile(
                icon: Icons.logout,
                label: 'Log Out',
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
