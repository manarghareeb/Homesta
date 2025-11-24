import 'package:flutter/material.dart';

class AIImageSection extends StatelessWidget {
  const AIImageSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final isSmallScreen = screenWidth < 360;
    final isMediumScreen = screenWidth >= 360 && screenWidth < 600;

    final containerWidth =
        isSmallScreen
            ? screenWidth * 0.9
            : isMediumScreen
            ? screenWidth * 0.88
            : 340.0;
    final containerHeight =
        isSmallScreen
            ? screenHeight * 0.35
            : isMediumScreen
            ? screenHeight * 0.38
            : 380.0;

    final imageWidth = containerWidth * 0.9;
    final imageHeight = containerHeight * 0.95;

    final imageTopPosition = containerHeight * 0.13;
    final imageLeftPosition = (containerWidth - imageWidth) / 2;

    return SizedBox(
      width: containerWidth * 1.3,
      height: containerHeight * 1.3,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned.fill(child: CustomPaint()),
          Positioned(
            top: imageTopPosition + 50,
            left: imageLeftPosition + 60,
            child: Image.asset(
              "assets/images/AI.png",
              width: imageWidth * 1.2,
              height: imageHeight * 1.2,
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(width: containerWidth, height: containerHeight),
        ],
      ),
    );
  }
}
