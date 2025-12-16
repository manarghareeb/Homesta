import 'package:flutter/material.dart';

class ResponsiveHelpers {
  static const double mobileSmall = 320;
  static const double mobileMedium = 375;
  static const double mobileLarge = 412;
  static const double tablet = 768;
  static const double desktop = 1024;

  static bool isMobileSmall(BuildContext context) {
    return MediaQuery.of(context).size.width < mobileMedium;
  }

  static bool isMobileMedium(BuildContext context) {
    return MediaQuery.of(context).size.width >= mobileMedium &&
        MediaQuery.of(context).size.width < mobileLarge;
  }

  static bool isMobileLarge(BuildContext context) {
    return MediaQuery.of(context).size.width >= mobileLarge &&
        MediaQuery.of(context).size.width < tablet;
  }

  static bool isTablet(BuildContext context) {
    return MediaQuery.of(context).size.width >= tablet &&
        MediaQuery.of(context).size.width < desktop;
  }

  static bool isDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width >= desktop;
  }

  static double getResponsiveWidth(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width < tablet) {
      return width * 0.85;
    } else if (width < desktop) {
      return 350;
    } else {
      return 400;
    }
  }

  static double getResponsiveHeight(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width > 600 ? 64.0 : 56.0;
  }

  static double getResponsiveFontSize(
    BuildContext context, {
    required double mobile,
    required double tablet,
    double? desktop,
  }) {
    final width = MediaQuery.of(context).size.width;
    if (width < ResponsiveHelpers.tablet) {
      return mobile;
    } else if (width < ResponsiveHelpers.desktop) {
      return tablet;
    } else {
      return desktop ?? tablet;
    }
  }
}
