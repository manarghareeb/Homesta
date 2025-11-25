import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:homesta/core/routing/app_router.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/theming/styles.dart';

class NameAndEditProfileSection extends StatelessWidget {
  const NameAndEditProfileSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Madison Smith',
            style: TextStyles.font16BlackRegular.copyWith(
              fontWeight: FontWeight.w500
            )),
        SizedBox(height: 16.h),
        TextButton(
          onPressed: (){
            GoRouter.of(context).push(AppRouter.editProfileScreen);
          }, 
          style: TextButton.styleFrom(
            backgroundColor: ColorManager.buttonColor,
            padding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 8.h,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r),
            ),
          ),
          child: Text(
            'Edit Profile',
            style: TextStyles.font16WhiteW500,
          ),
        )
      ],
    );
  }
}