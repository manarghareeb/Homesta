import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/theming/styles.dart';

class FAQCategorySelector extends StatefulWidget {
  final List<String> categories;
  final Function(int index) onCategorySelected;

  const FAQCategorySelector({
    super.key,
    required this.categories,
    required this.onCategorySelected,
  });

  @override
  State<FAQCategorySelector> createState() => _FAQCategorySelectorState();
}

class _FAQCategorySelectorState extends State<FAQCategorySelector> {
  int? activeIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(widget.categories.length, (index) {
        final isActive = index == activeIndex;

        return Column(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  if (activeIndex == index) {
                    activeIndex = null;
                  } else {
                    activeIndex = index;
                  }
                });
                widget.onCategorySelected(index);
              },
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 14.h),
                decoration: BoxDecoration(
                  color:
                      isActive ? ColorManager.thirdColor : Colors.transparent,
                  borderRadius: BorderRadius.circular(15.r),
                  border:
                      isActive
                          ? null
                          : Border.all(color: ColorManager.lightGreyColor),
                ),
                child: Text(
                  widget.categories[index],
                  style: TextStyles.font16BlackRegular,
                ),
              ),
            ),
            SizedBox(height: 16.h),
          ],
        );
      }),
    );
  }
}
