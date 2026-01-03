import 'package:flutter/material.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/theming/styles.dart';
import 'package:homesta/core/widgets/custom_app_bar_widget.dart';
import 'package:homesta/features/seller/company%20data/presentation/widgets/about_cart.dart';
import 'package:homesta/features/seller/company%20data/presentation/widgets/detail_row.dart';
import 'package:homesta/features/seller/company%20data/presentation/widgets/mission_vision_cart.dart';

class CompanyDataScreen extends StatelessWidget {
  const CompanyDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.soLightGreyColor,
      appBar: CustomAppBarWidget(
        text: 'Company Data',
        backgroundColor: ColorManager.soLightGreyColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            children: [
              const AboutCard(),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: MissionVisionCard(
                      title: "Our Mission",
                      content:
                          "To provide exceptional furniture and home decor that combines quality, style, and affordability...",
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: MissionVisionCard(
                      title: "Our Vision",
                      content:
                          "To be the most trusted and innovative furniture brand, creating inspiring spaces...",
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              //const CompanyDetails(),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 16,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Company Details",
                      style: TextStyles.font20BlackColorW500,
                    ),
                    const SizedBox(height: 16),
                    DetailRow(label: "Brand Name", value: "CasaLux"),
                    DetailRow(label: "Full Name", value: "Mohamed Ahmed"),
                    DetailRow(label: "Founded", value: "2010"),
                    DetailRow(label: "Headquarters", value: "Egypt"),
                    DetailRow(label: "Email", value: "info@homesta.com"),
                    DetailRow(label: "Phone", value: "+123-456-789"),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.bar_chart, color: Colors.white),
                  label: Text("Analytics", style: TextStyles.font16WhiteW500),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorManager.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
