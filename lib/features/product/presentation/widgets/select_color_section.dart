import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/theming/styles.dart';

class SelectColorSection extends StatelessWidget {
  const SelectColorSection({
    super.key,
    required this.selectedColorName,
    this.onColorSelected,
  });

  final String selectedColorName;
  final ValueChanged<Color>? onColorSelected;

  @override
  Widget build(BuildContext context) {
    final List<Color> colors = [
      ColorManager.primaryColor,
      ColorManager.blackColor,
      ColorManager.thirdColor,
      ColorManager.greyColor,
    ];

    final List<String> colorNames = ['Green', 'Black', 'Orange', 'Grey'];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: 'Select Color: ',
            style: TextStyles.font18BlackW500,
            children: [
              TextSpan(
                text: selectedColorName,
                style: TextStyles.font18BlackW500.copyWith(
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
          children: List.generate(colors.length, (index) {
            return GestureDetector(
              onTap:
                  onColorSelected != null
                      ? () => onColorSelected!(colors[index])
                      : null,
              child: Container(
                height: 32.h,
                width: 32.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: colors[index],
                  border: Border.all(
                    color:
                        colorNames[index] == selectedColorName
                            ? ColorManager.primaryColor
                            : Colors.transparent,
                    width: 2,
                  ),
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
}
