import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/core/theming/colors.dart';

class TextStyles {
  // style for onboarding title
  static TextStyle font18BlackW500 = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w500,
    color: ColorManager.blackColor,
    fontFamily: 'Outfit'
  );
  // style for grey text
  static TextStyle font16GreyRegular = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    fontFamily: 'Outfit',
    color: ColorManager.greyColor,
  );
  static TextStyle font16BlackRegular = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    fontFamily: 'Outfit',
    color: ColorManager.blackColor,
  );
  // style for ButtonColor text
  static TextStyle font24ButtonColorW500 = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.w500,
    fontFamily: 'Outfit',
    color: ColorManager.buttonColor,
  );
  // style for text Button text
  static TextStyle font16WhiteW500 = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    fontFamily: 'Outfit',
    color: Colors.white,
  );
  static TextStyle font15BrownW200 = TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeight.w200,
    fontFamily: 'Outfit',
    color: ColorManager.brounColor,
  );
  static TextStyle font13BrownW400 = TextStyle(
    fontSize: 13.sp,
    fontWeight: FontWeight.w400,
    fontFamily: 'Outfit',
    color: ColorManager.brounColor,
  );

  /// Styles in my order screen
  static TextStyle font13OrderColorW300 = TextStyle(
    fontSize: 13.sp,
    fontWeight: FontWeight.w300,
    fontFamily: 'League Spartan',
    color: ColorManager.orderColor,
  );
  static TextStyle font14OrderColorW400 = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    fontFamily: 'League Spartan',
    color: ColorManager.orderColor,
  );
  static TextStyle font12OrderColorW400 = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    fontFamily: 'League Spartan',
    color: ColorManager.orderColor,
  );
}
