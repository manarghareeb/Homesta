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
    /*Color parseColor(String colorString) {
      if (colorString.startsWith('#')) {
        return Color(
          int.parse(colorString.substring(1), radix: 16) + 0xFF000000,
        );
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
    }*/

    Color parseColor(String colorString) {
      colorString = colorString.toLowerCase().trim();

      if (colorString.startsWith('#')) {
        if (colorString.length == 4) {
          colorString =
              '#' +
              colorString[1] +
              colorString[1] +
              colorString[2] +
              colorString[2] +
              colorString[3] +
              colorString[3];
        }
        return Color(
          int.parse(colorString.substring(1), radix: 16) + 0xFF000000,
        );
      }

      Map<String, Color> namedColors = {
        'black': Colors.black,
        'white': Colors.white,
        'grey': Colors.grey,
        'gray': Colors.grey,
        'red': Colors.red,
        'green': Colors.green,
        'blue': Colors.blue,
        'yellow': Colors.yellow,
        'orange': Colors.orange,
        'brown': Colors.brown,
        'pink': Colors.pink,
        'silver': Color(0xFFC0C0C0),
        'gold': Color(0xFFFFD700),
        'cream': Color(0xFFFFFDD0),
        'offwhite': Color(0xFFFFF8E1),
        'beige': Color(0xFFF5F5DC),
      };

      return namedColors[colorString] ?? Colors.grey;
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
                  color: ColorManager.primaryColor,
                ),
              ),
            ],
          ),
          textAlign: TextAlign.start,
        ),
        SizedBox(height: 8.h),
        Wrap(
          spacing: 8.w,
          children:
              colorStrings.map((colorName) {
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
                        color:
                            isSelected
                                ? ColorManager.primaryColor
                                : Colors.transparent,
                        width: 2,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: ColorManager.deepGreyColor,
                          blurRadius: 2
                        )
                      ]
                    ),
                    child:
                        isSelected
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
