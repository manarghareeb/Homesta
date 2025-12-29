import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/core/theming/colors.dart';

class HomeCategories extends StatelessWidget {
  const HomeCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Title
        Row(
          children: [
            const Text(
              'Categories',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const Spacer(),
            TextButton(
              onPressed: () {},
              child: const Text(
                'More',
                style: TextStyle(color: ColorManager.greyColor),
              ),
            ),
          ],
        ),

        SizedBox(height: 12.h),

        Wrap(
          spacing: 10.w,
          runSpacing: 10.h,
          children: [
            _chip(
              title: 'Living Room',
              imagePath: 'assets/images/chair.png',
              selected: true,
            ),
            _chip(
              title: 'Sanitary',
              imagePath: 'assets/images/chair.png',
              selected: false,
            ),
            _chip(
              title: 'Dining',
              imagePath: 'assets/images/chair.png',
              selected: false,
            ),
          ],
        ),
      ],
    );
  }

  Widget _chip({
    required String title,
    required String imagePath,
    required bool selected,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
      decoration: BoxDecoration(
        color: selected ? Colors.white : ColorManager.thirdColor,
        borderRadius: BorderRadius.circular(18.r),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 6),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(imagePath, width: 18.w, height: 18.h),
          SizedBox(width: 6.w),
          Text(
            title,
            style: TextStyle(
              color: selected ? Colors.black : Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 10.sp,
            ),
          ),
        ],
      ),
    );
  }
}
