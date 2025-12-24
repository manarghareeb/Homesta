import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/core/theming/colors.dart';

class HomeCategories extends StatelessWidget {
  const HomeCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
        SizedBox(
          height: 38.h,
          child: ListView(
            scrollDirection: Axis.horizontal,
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
      margin: EdgeInsets.only(right: 10.w),
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      decoration: BoxDecoration(
        color: selected ? Colors.white : ColorManager.thirdColor,
        borderRadius: BorderRadius.circular(15.r),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 6),
        ],
      ),
      child: Row(
        children: [
          Image.asset(imagePath, width: 18.w, height: 18.h),

          SizedBox(width: 6.w),

          /// 📝 TEXT
          Text(
            title,
            style: TextStyle(
              color: selected ? Colors.black : Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 13.sp,
            ),
          ),
        ],
      ),
    );
  }
}
