import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResponsiveConstants {
  static bool isSmallScreen(BuildContext context) =>
      MediaQuery.of(context).size.width < 360;

  static bool isMediumScreen(BuildContext context) =>
      MediaQuery.of(context).size.width >= 360 &&
      MediaQuery.of(context).size.width < 600;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 600 &&
      MediaQuery.of(context).size.width < 900;

  static bool isLargeTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 900;

  static double responsiveValue(
    BuildContext context, {
    required double mobile,
    required double tablet,
    double? large,
  }) {
    final width = MediaQuery.of(context).size.width;

    if (width < 600) {
      return mobile.w;
    } else if (width < 900) {
      return tablet.w;
    } else {
      return (large ?? tablet).w;
    }
  }

  static double fontSize(
    BuildContext context, {
    required double mobile,
    required double tablet,
    double? large,
  }) {
    final width = MediaQuery.of(context).size.width;

    if (width < 600) {
      return mobile.sp;
    } else if (width < 900) {
      return tablet.sp;
    } else {
      return (large ?? tablet).sp;
    }
  }
}
