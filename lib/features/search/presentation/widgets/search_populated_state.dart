import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/core/theming/colors.dart';

class SearchPopulatedState extends StatelessWidget {
  const SearchPopulatedState({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        // 🔁 Recent Searches
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Recent Searches',
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'Clear',
                style: TextStyle(fontSize: 14.sp, color: ColorManager.buttonColor),
              ),
            ),
          ],
        ),
        SizedBox(height: 8.h),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: ['Chair', 'Cooker', 'Mirror']
              .map((item) => ListTile(
            leading: const Icon(Icons.access_time, size: 20),
            title: Text(item),
          ))
              .toList(),
        ),
        SizedBox(height: 24.h),

        // 🔥 Popular Category
        Text(
          'Popular Category',
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 12.h),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: ['Bedrooms', 'Living Room', 'Kitchen', 'Home Tools']
              .map((title) => ListTile(
            leading: const Icon(Icons.search, size: 20),
            title: Text(title),
          ))
              .toList(),
        ),
        SizedBox(height: 24.h),

        // 🎯 Suggested Category
        // 🎯 Suggested Category
        // 🎯 Suggested Category
        Text(
          'Suggested Category',
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 12.h),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSuggestedItem('Bedrooms', 'assets/images/bedroom.png'),
            SizedBox(height: 12.h),
            _buildSuggestedItem('Living Room', 'assets/images/livingroom.png'),
            SizedBox(height: 12.h),
            _buildSuggestedItem('Home Tools', 'assets/images/tools.png'),
          ],
        ),
      ],
    );
  }

  Widget _buildSuggestedItem(String title, String imagePath) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: Colors.black.withAlpha(5),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
      padding: EdgeInsets.all(12.w),
      alignment: Alignment.center,
      height: 140.h,
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          shadows: [
            Shadow(
              color: Colors.black.withAlpha(6),
              offset: const Offset(0, 1),
              blurRadius: 4,
            ),
          ],
        ),
      ),
    );
  }
}
