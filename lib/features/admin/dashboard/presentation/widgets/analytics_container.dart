import 'package:flutter/material.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/features/seller/analytics/presentation/widgets/data_analytics.dart';

class AnalyticsContainer extends StatelessWidget {
  final DataAnalytics firstRowItem1;
  final DataAnalytics firstRowItem2;
  final DataAnalytics secondRowItem1;
  final DataAnalytics? secondRowItem2;

  const AnalyticsContainer({
    super.key,
    required this.firstRowItem1,
    required this.firstRowItem2,
    required this.secondRowItem1,
    this.secondRowItem2,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: ColorManager.aliceBlue,
        border: Border.all(color: ColorManager.aliceBlue),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(child: firstRowItem1),
              const SizedBox(width: 16),
              Expanded(child: firstRowItem2),
            ],
          ),
          const SizedBox(height: 16),
          if (secondRowItem2 != null)
            Row(
              children: [
                Expanded(child: secondRowItem1),
                const SizedBox(width: 16),
                Expanded(child: secondRowItem2!),
              ],
            )
          else
            secondRowItem1,
        ],
      ),
    );
  }
}
