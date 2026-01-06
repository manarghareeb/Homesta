import 'package:flutter/material.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/theming/styles.dart';

class ChatHeaderBubble extends StatelessWidget {
  const ChatHeaderBubble({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final topPadding = 24 + MediaQuery.of(context).padding.top;

    final leftPadding = screenWidth * 0.07;
    final rightPadding = screenWidth * 0.04;
    final verticalPadding = screenWidth < 360 ? 10.0 : 14.0;

    return Positioned(
      top: topPadding,
      left: 32,
      right: 90,
      child: Container(
        padding: EdgeInsets.fromLTRB(
          leftPadding,
          verticalPadding,
          rightPadding,
          verticalPadding,
        ),
        decoration: BoxDecoration(
          color: ColorManager.primaryColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(18),
            topRight: Radius.circular(15),
            bottomLeft: Radius.circular(12),
            bottomRight: Radius.circular(8),
          ),
        ),
        child: Text(
          "Hi! I will help you",
          style: TextStyles.font16WhiteW500.copyWith(
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
