import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/theming/styles.dart';

class SelectColorSection extends StatelessWidget {
  const SelectColorSection({
    super.key,
    required this.selectedColor,
    this.onColorSelected, 
    required this.colorStrings,
  });

  final List<String> colorStrings; 
  final String selectedColor;
  final ValueChanged<String>? onColorSelected;

  @override
  Widget build(BuildContext context) {
    Color parseColor(String colorString) {
    if (colorString.startsWith('#')) {
      return Color(int.parse(colorString.substring(1), radix: 16) + 0xFF000000);
    }
    switch (colorString.toLowerCase()) {
      case 'green':
        return Colors.green;
      case 'black':
        return Colors.black;
      case 'orange':
        return Colors.orange;
      case 'grey':
        return Colors.grey;
      case 'yellow':
        return Colors.yellow;
      default:
        return Colors.grey; 
    }
  }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: 'Select Color: ',
            style: TextStyles.font18BlackW500,
            children: [
              TextSpan(
                text: selectedColor,
                style: TextStyles.font18BlackW500.copyWith(
                  //color: parseColor(selectedColor),
                  color: ColorManager.primaryColor
                ),
              ),
            ],
          ),
          textAlign: TextAlign.start,
        ),
        SizedBox(height: 8.h),
        Wrap(
          spacing: 8.w,
          children: colorStrings.map((colorName) {
            final color = parseColor(colorName);
            final isSelected = colorName == selectedColor;
            return GestureDetector(
              onTap: () {
                if (onColorSelected != null) onColorSelected!(colorName);
              },
              child: Container(
                height: 32.h,
                width: 32.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: color,
                  border: Border.all(
                    color: isSelected ? ColorManager.primaryColor : Colors.transparent,
                    width: 2,
                  ),
                ),
                child: isSelected
            ? Center(
                child: Container(
                  height: 12.h,
                  width: 12.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                ),
              )
            : null,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
