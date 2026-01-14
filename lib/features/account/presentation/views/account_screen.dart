import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:homesta/core/routing/app_router.dart';
import 'package:homesta/core/theming/styles.dart';
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
                  Column(
                    children: [
                      Text(
                        'Maram Ahmed',
                        style: TextStyles.font16BlackRegular.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 6.h),
                      Text(
                        'Customer Operations',
                        style: TextStyles.font14GreyColorW400,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              const Divider(),
              SizedBox(height: 24.h),
              OptionTile(
                icon: Icons.person_outline,
                label: 'Personal Data',
                onTap: () {
                  GoRouter.of(context).push(AppRouter.editProfileScreen);
                },
              ),
              /*OptionTile(
                icon: Icons.payment,
                label: 'Payment Account',
                onTap: () {
                  GoRouter.of(context).push(AppRouter.paymentAccountScreen);
                },
              ),*/
              OptionTile(
                icon: Icons.list_alt,
                label: 'My Order',
                onTap: () {
                  GoRouter.of(context).push(AppRouter.myOrderScreen);
                },
              ),
              /*OptionTile(
                icon: Icons.favorite_border,
                label: 'My Collections',
                onTap: () {
                  GoRouter.of(context).push(AppRouter.collectionsScreen);
                },
              ),*/
              OptionTile(
                icon: Icons.lock_outline,
                label: 'Password Manager',
                onTap: () {
                  GoRouter.of(context).push(AppRouter.passwordManager);
                },
              ),
              SizedBox(height: 8.h),
              const Divider(),
              SizedBox(height: 24.h),
              OptionTile(
                icon: Icons.settings_outlined,
                label: 'Setting',
                onTap: () {
                  GoRouter.of(context).push(AppRouter.settingScreen);
                },
              ),
              OptionTile(
                icon: Icons.logout,
                label: 'Log Out',
                onTap: () {
                  GoRouter.of(context).push(AppRouter.logoutScreen);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
