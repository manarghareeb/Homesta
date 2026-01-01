import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/core/theming/colors.dart';

import '../../../../core/theming/styles.dart';

class SearchPopulatedState extends StatelessWidget {
  const SearchPopulatedState({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        /// 🔁 Recent Searches
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Recent Searches', style: TextStyles.font18BoldBlack),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Clear',
                  style: TextStyle(
                    fontSize: 13.sp,
                    color: ColorManager.lightGreyColor,
                  ),
                ),
              ),
            ],
          ),
        ),

        ...['Chair', 'Cooker', 'Mirror'].map(
          (item) => ListTile(
            leading: const Icon(Icons.access_time, size: 20),
            title: Text(item),
          ),
        ),

        SizedBox(height: 24.h),

        /// 🔥 Popular Category
        Text('Popular Category', style: TextStyles.font18BlackW500),
        SizedBox(height: 12.h),

        ...['Bedrooms', 'Living Room', 'Kitchen', 'Home Tools'].map(
          (title) => ListTile(
            leading: const Icon(Icons.search, size: 20),
            title: Text(title),
          ),
        ),

        SizedBox(height: 24.h),

        /// ⭐ Suggested Category
        Text('Suggested Category', style: TextStyles.font18BlackW500),
        SizedBox(height: 12.h),

        _buildSuggestedItem(
          'Bedrooms',
          'assets/images/catrgories_image/bedroom.png',
        ),
        SizedBox(height: 12.h),

        _buildSuggestedItem(
          'Living Room',
          'assets/images/catrgories_image/livingroom.png',
        ),
        SizedBox(height: 12.h),

        _buildSuggestedItem(
          'Home Tools',
          'assets/images/catrgories_image/tools.png',
        ),

        SizedBox(height: 20.h),
      ],
    );
  }

  Widget _buildSuggestedItem(String title, String imagePath) {
    return Container(
      height: 140.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        image: DecorationImage(image: AssetImage(imagePath), fit: BoxFit.cover),
      ),
      alignment: Alignment.center,
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          shadows: [
            Shadow(color: Colors.black.withOpacity(0.5), blurRadius: 4),
          ],
        ),
      ),
    );
  }
}
