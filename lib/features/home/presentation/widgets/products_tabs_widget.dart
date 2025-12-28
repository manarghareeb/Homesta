import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/core/theming/colors.dart';

import '../../../../core/theming/styles.dart';

class ProductsTabsWidget extends StatelessWidget {
  const ProductsTabsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final bool isSmall = constraints.maxWidth < 400;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text("Our", style: TextStyles.font16BlackW500),
                const SizedBox(width: 4),
                Text(
                  'Products Collections',
                  style: TextStyles.font16PrimaryColorW400,
                ),
              ],
            ),

            SizedBox(height: 12.h),

            Wrap(
              spacing: isSmall ? 12.w : 20.w,
              runSpacing: 8.h,
              children: [
                _tabItem('All Products', false),
                _tabItem('Latest Product', true),
                _tabItem('Best Seller', false),
                _tabItem('Featured', false),
              ],
            ),
          ],
        );
      },
    );
  }

  Widget _tabItem(String title, bool selected) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color:
            selected
                ? ColorManager.primaryColor.withOpacity(0.08)
                : Colors.transparent,
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 14.sp,
          fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
          color: selected ? ColorManager.primaryColor : Colors.grey,
          decoration: selected ? TextDecoration.underline : TextDecoration.none,
        ),
      ),
    );
  }
}
