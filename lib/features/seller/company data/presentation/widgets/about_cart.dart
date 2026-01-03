import 'package:flutter/material.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/theming/styles.dart';

class AboutCard extends StatelessWidget {
  const AboutCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            blurRadius: 8,
            color: Colors.black.withOpacity(0.25),
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              'assets/images/image 1.png',
              height: 180,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 16),
          Text("CasaLux", style: TextStyles.font16BlackW500),
          SizedBox(height: 8),
          Text(
            "Elegant Living & Home Essentials",
            style: TextStyles.font14GreyColorW400,
          ),
          const SizedBox(height: 8),
          Text(
            "CasaLux is a premium furniture and home decor company offering high-quality products for every corner of your home...",
            textAlign: TextAlign.center,
            style: TextStyles.font12GreyColorW400.copyWith(
              color: ColorManager.deepGreyColor,
            ),
          ),
        ],
      ),
    );
  }
}
