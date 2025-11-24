import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/theming/styles.dart';
import 'package:homesta/features/search/presentation/widgets/popular_search_section.dart';
import 'package:homesta/features/search/presentation/widgets/recent_search_section.dart';
import 'package:homesta/features/search/presentation/widgets/search_section.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SearchSection(),
            SizedBox(height: 32.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Recent search', style: TextStyles.font15BrownW200),
                      InkWell(
                        onTap: () {},
                        child: Text(
                          'Clear All',
                          style: TextStyles.font15BrownW200,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  const RecentSearchSection(),
                  SizedBox(height: 32.h),
                  Text('Popular search', style: TextStyles.font15BrownW200),
                  SizedBox(height: 16.h),
                  const PopularSearchSection(),
                  SizedBox(height: 35.h),
                  Row(
                    children: [
                      Icon(
                        Icons.camera_alt_outlined,
                        color: ColorManager.iconTextFieldColor,
                        size: 20.sp,
                      ),
                      SizedBox(width: 7.w),
                      Text('Camera Search', style: TextStyles.font15BrownW200),
                    ],
                  ),
                  SizedBox(height: 29.h),
                  Wrap(
                    spacing: 16.w,
                    runSpacing: 8.h,
                    children: List.generate(
                      4,
                      (index) => Container(
                        height: 120.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Image.asset('assets/images/image 3.png'),
                      ),
                    ),
                  ),
                  SizedBox(height: 32.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
