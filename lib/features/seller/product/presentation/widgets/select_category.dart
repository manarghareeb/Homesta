import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/theming/styles.dart';

class SelectCategory extends StatefulWidget {
  const SelectCategory({super.key});

  @override
  State<SelectCategory> createState() => _SelectCategoryState();
}

class _SelectCategoryState extends State<SelectCategory> {
  String? selectedCategory;

  final List<String> categories = [
    "Bedrooms",
    "Living Room",
    "Kitchen",
    "Electrical App",
    "Outdoor",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: ColorManager.lightGreyIconColor),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          dropdownColor: Colors.white,
          borderRadius: BorderRadius.circular(15),
          value: selectedCategory,
          hint: Text(
            'Select the category of the added item',
            style: TextStyles.font16BlackW500,
          ),
          isExpanded: true,
          icon: const Icon(Icons.keyboard_arrow_down_rounded),
          items:
              categories
                  .map((cat) => DropdownMenuItem(value: cat, child: Text(cat)))
                  .toList(),
          onChanged: (value) {
            setState(() {
              selectedCategory = value;
            });
          },
        ),
      ),
    );
  }
}
