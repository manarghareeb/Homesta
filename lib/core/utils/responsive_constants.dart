import 'package:flutter/material.dart';

class ResponsiveConstants {
  // Screen Size Categories
  static bool isSmallScreen(BuildContext context) {
    return MediaQuery.of(context).size.width < 360;
  }

  static bool isMediumScreen(BuildContext context) {
    return MediaQuery.of(context).size.width >= 360 &&
        MediaQuery.of(context).size.width < 600;
  }

  static bool isTablet(BuildContext context) {
    return MediaQuery.of(context).size.width >= 600;
  }

  static bool isLargeTablet(BuildContext context) {
    return MediaQuery.of(context).size.width >= 800;
  }

  // Helper function to get scaled value
  static double getScaledValue(
    BuildContext context, {
    required double small,
    required double medium,
    required double tablet,
    double? large,
  }) {
    final width = MediaQuery.of(context).size.width;
    if (width < 360) return small;
    if (width < 600) return medium;
    if (width < 800) return tablet;
    return large ?? tablet;
  }
}
