import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/core/theming/colors.dart';
import '../../../../core/theming/styles.dart';

class SearchEmptyState extends StatelessWidget {
  const SearchEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 40.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.search_rounded,
              size: 100.r,
              color: ColorManager.greyColor,
            ),
            SizedBox(height: 20.h),
            Text('No searches yet..', style: TextStyles.font20BlackColorW500),
            SizedBox(height: 8.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Text(
                'Start now and explore all your home essentials in one place.',
                textAlign: TextAlign.center,
                style: TextStyles.font16GreyRegular,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
