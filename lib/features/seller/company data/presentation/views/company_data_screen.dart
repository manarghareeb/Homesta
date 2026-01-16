import 'package:flutter/material.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/widgets/custom_app_bar_widget.dart';
import 'package:homesta/features/seller/company%20data/presentation/widgets/get_store_bloc_builder.dart';

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
              /*const AboutCard(),
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
              const SizedBox(height: 24),*/
              //const CompanyDetails(),
             GetStoreBlocBuilder(),
              
              const SizedBox(height: 24),
              /*SizedBox(
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
              ),*/
            ],
          ),
        ),
      ),
    );
  }
}
