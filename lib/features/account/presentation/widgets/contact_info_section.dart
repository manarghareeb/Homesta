import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/theming/styles.dart';

class ContactInfoSection extends StatelessWidget {
  const ContactInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 24.w),
      decoration: BoxDecoration(
        color: ColorManager.primaryColor,
        borderRadius: BorderRadius.circular(25.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Address', style: TextStyles.font16WhiteW500),
          SizedBox(height: 8.h),
          Text(
            '8502 Preston Rd. Inglewood, Maine 98380',
            style: TextStyles.font14WhiteColorW400,
          ),
          SizedBox(height: 32.h),
          Text('Contact', style: TextStyles.font16WhiteW500),
          SizedBox(height: 8.h),
          Text(
            'Phone: +0123-456-789\nEmail: example@gmail.com',
            style: TextStyles.font14WhiteColorW400,
          ),
          SizedBox(height: 32.h),
          Text('Open Time', style: TextStyles.font16WhiteW500),
          SizedBox(height: 8.h),
          Text(
            'Monday - Friday: 10:00-2\nSaturday Sunday: 11:00-18:00',
            style: TextStyles.font14WhiteColorW400,
          ),
          SizedBox(height: 32.h),
          Text('Stay Connected', style: TextStyles.font16WhiteW500),
          SizedBox(height: 8.h),
          Row(
            children: [
              Icon(Icons.facebook, color: ColorManager.thirdColor),
              SizedBox(width: 16.w),
              Icon(FontAwesomeIcons.twitter, color: ColorManager.thirdColor),
              SizedBox(width: 16.w),
              Icon(FontAwesomeIcons.youtube, color: ColorManager.thirdColor),
              SizedBox(width: 16.w),
              Icon(FontAwesomeIcons.pinterest, color: ColorManager.thirdColor),
              SizedBox(width: 16.w),
              Icon(FontAwesomeIcons.instagram, color: ColorManager.thirdColor),
            ],
          ),
        ],
      ),
    );
  }
}
