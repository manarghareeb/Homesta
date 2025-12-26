
import 'package:flutter/material.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/theming/styles.dart';


class ProductSpecificationTable extends StatelessWidget {
  const ProductSpecificationTable({super.key});

  // البيانات في List
  final List<Map<String, String>> specs = const [
    {"feature": "Seat Material", "value": "Leather"},
    {"feature": "Color", "value": "Green, Black, Brown"},
    {"feature": "Item Weight", "value": "10 Kilograms"},
    {"feature": "Dimensions", "value": "21\"D * 21\"W * 48\"H"},
    {"feature": "Brand", "value": "KD Design"},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xffE0DFDF), width: 1),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        children: [
          // Header Row
          Container(
            decoration: BoxDecoration(
              color: ColorManager.thirdColor,
              borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
            ),
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            child: Row(
              children:  [
                Expanded(child: Text("Feature", style: TextStyles.font16BlackW500,)),
                Expanded(child: Text("Description", style: TextStyles.font16BlackW500,)),
              ],
            ),
          ),

          // Data Rows
          ...specs.asMap().entries.map((entry) {
            int index = entry.key;
            bool isLast = index == specs.length - 1;
            return Container(
              decoration: BoxDecoration(
                color: index % 2 == 0 ? ColorManager.whihte : ColorManager.soLightGreyColor,
                borderRadius: isLast
                    ? const BorderRadius.vertical(bottom: Radius.circular(30))
                    : BorderRadius.zero, // آخر صف يكون له الزوايا السفلية
              ),
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              child: Row(
                children: [
                  Expanded(child: Text(entry.value['feature']!,style: TextStyles.font16BlackW500,)),
                  Expanded(child: Text(entry.value['value']!,style: TextStyles.font16BlackW500,)),
                ],
              ),
            );
          }).toList(),
        ],
      ),
    );
  }
}
