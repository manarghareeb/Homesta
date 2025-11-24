import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/theming/styles.dart';

class SearchSection extends StatelessWidget {
  const SearchSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 180.h,
      decoration: BoxDecoration(
        color: ColorManager.brounColor,
        borderRadius: BorderRadius.only(bottomRight: Radius.circular(80.r)),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 55, left: 16, right: 16).r,
        child: TextField(
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            hintText: 'Search',
            hintStyle: TextStyles.font15BrownW200.copyWith(
              color: ColorManager.greyColor,
            ),
            prefixIcon: const Icon(
              Icons.search,
              color: ColorManager.brounColor,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
          ),
        ),
      ),
    );
  }
}
