import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/core/theming/colors.dart';

class SearchEmptyState extends StatelessWidget {
  const SearchEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.search_rounded, size: 100.r, color: ColorManager.greyColor),
            SizedBox(height: 20.h),
            Text(
              'No searches yet..',
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.h),
            Text(
              'Start now and explore all your home essentials in one place.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14.sp, color: ColorManager.greyColor),
            ),
          ],
        ),
      ),
    );
  }
}
