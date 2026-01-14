import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:homesta/core/routing/app_router.dart';
import 'package:homesta/core/theming/styles.dart';
import 'package:homesta/features/account/presentation/widgets/option_tile.dart';
import 'package:homesta/features/account/presentation/widgets/photo_profile.dart';
import 'package:image_picker/image_picker.dart';

class AdminAccountScreen extends StatelessWidget {
  const AdminAccountScreen({super.key});

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
                  PhotoProfile(onImageSelected: (XFile? p1) {  },),
                  SizedBox(width: 24.w),
                  Column(
                    children: [
                      Text(
                        'Admin',
                        style: TextStyles.font16BlackRegular.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 6.h),
                      Text('Admin', style: TextStyles.font14GreyColorW400),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              const Divider(),
              SizedBox(height: 24.h),
              OptionTile(
                icon: Icons.person_outline,
                label: 'Dashboard',
                onTap: () {
                  GoRouter.of(context).push(AppRouter.adminDashboardScreen);
                },
              ),
              OptionTile(
                icon: Icons.production_quantity_limits_outlined,
                label: 'Product',
                onTap: () {
                  GoRouter.of(context).push(AppRouter.adminProductScreen);
                },
              ),
              OptionTile(
                icon: Icons.analytics_outlined,
                label: 'Category',
                onTap: () {
                  GoRouter.of(context).push(AppRouter.adminCategoryScreen);
                },
              ),
              SizedBox(height: 8.h),
              const Divider(),
              SizedBox(height: 24.h),
              OptionTile(
                icon: Icons.settings_outlined,
                label: 'Setting',
                onTap: () {},
              ),
              OptionTile(icon: Icons.logout, label: 'Log Out', onTap: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
