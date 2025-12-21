import 'package:flutter/material.dart';
import 'package:homesta/core/theming/colors.dart';

class TitleSection extends StatelessWidget {
  const TitleSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final isSmallScreen = screenWidth < 360;
    final isMediumScreen = screenWidth >= 360 && screenWidth < 600;

    final titleFontSize =
        isSmallScreen
            ? 40.0
            : isMediumScreen
            ? 50.0
            : 60.0;
    final descriptionFontSize =
        isSmallScreen
            ? 14.0
            : isMediumScreen
            ? 16.0
            : 18.0;
    final horizontalPadding =
        isSmallScreen
            ? 16.0
            : isMediumScreen
            ? 20.0
            : 24.0;
    final verticalSpacing = isSmallScreen ? 8.0 : 12.0;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Your ",
                style: TextStyle(
                  fontSize: titleFontSize,
                  fontWeight: FontWeight.w500,
                  fontFamily: "Outfit",
                  color: Colors.white,
                  height: 1.2,
                ),
              ),
              Text(
                "AI Assistant",
                style: TextStyle(
                  fontSize: titleFontSize - 10,
                  fontWeight: FontWeight.w500,
                  fontFamily: "Outfit",
                  color: ColorManager.buttonColor,
                  height: 1.2,
                ),
              ),
            ],
          ),
          SizedBox(height: verticalSpacing),
          Text(
            "Experience the power of AI chat in\nthe palm of your hand",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: descriptionFontSize,
              color: ColorManager.greyColor,
              height: 1.6,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
