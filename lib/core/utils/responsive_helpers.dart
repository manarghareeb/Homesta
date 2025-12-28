import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResponsiveHelpers {
  static const double mobileSmall = 320;
  static const double mobileMedium = 375;
  static const double mobileLarge = 412;
  static const double tablet = 768;
  static const double desktop = 1024;

  static bool isMobileSmall(BuildContext context) =>
      MediaQuery.of(context).size.width < mobileMedium;

  static bool isMobileMedium(BuildContext context) =>
      MediaQuery.of(context).size.width >= mobileMedium &&
      MediaQuery.of(context).size.width < mobileLarge;

  static bool isMobileLarge(BuildContext context) =>
      MediaQuery.of(context).size.width >= mobileLarge &&
      MediaQuery.of(context).size.width < tablet;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= tablet &&
      MediaQuery.of(context).size.width < desktop;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= desktop;

  static double responsiveWidth(BuildContext context, double value) {
    return value.w;
  }

  static double responsiveHeight(BuildContext context, double value) {
    return value.h;
  }

  static double responsiveFont(
    BuildContext context, {
    required double mobile,
    required double tablet,
    double? desktop,
  }) {
    if (isDesktop(context)) {
      return (desktop ?? tablet).sp;
    } else if (isTablet(context)) {
      return tablet.sp;
    } else {
      return mobile.sp;
    }
  }
}
