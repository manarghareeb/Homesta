import 'package:flutter/material.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/widgets/custom_app_bar_widget.dart';
import 'package:homesta/features/seller/analytics/presentation/widgets/best_and_least_selling_products.dart';
import 'package:homesta/features/seller/analytics/presentation/widgets/data_analytics.dart';

class SalesAnalyticsScreen extends StatelessWidget {
  const SalesAnalyticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.soLightGreyColor,
      appBar: CustomAppBarWidget(
        text: 'Add Product',
        backgroundColor: ColorManager.soLightGreyColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: ColorManager.aliceBlue,
                  border: Border.all(color: ColorManager.aliceBlue),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: DataAnalytics(
                            title: 'Total Products',
                            subTitle: '6',
                          ),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: DataAnalytics(
                            title: 'Total Sales',
                            subTitle: '500',
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    DataAnalytics(title: 'Total Profit', subTitle: '\$88,650'),
                  ],
                ),
              ),
              SizedBox(height: 24),
              BestAndLeastSellingProducts(
                color: ColorManager.primaryColor,
                title: 'Best Selling Products',
                count: '1',
                nameProduct: 'Ergonomic Office Chair',
                categoryProduct: 'Furniture',
                salesNumber: '230 units',
                percentage: '46.0%',
                profit: '\$28.000',
              ),
              SizedBox(height: 24),
              BestAndLeastSellingProducts(
                color: ColorManager.redColor,
                title: 'Least Selling Products',
                count: '1',
                nameProduct: 'Ceramic Table Lamp',
                categoryProduct: 'Office Furniture',
                salesNumber: '12 units',
                percentage: '2.4%',
                profit: '\$3.200',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
