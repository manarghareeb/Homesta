import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/core/theming/colors.dart';

class ProductsTabsWidget extends StatelessWidget {
  const ProductsTabsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Our Products Collections',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        SizedBox(height: 12.h),

        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              _tabItem('All Products', false),
              _tabItem('Latest Product', true),
              _tabItem('Best Seller', false),
              _tabItem('Featured', false),
            ],
          ),
        ),
      ],
    );
  }

  Widget _tabItem(String title, bool selected) {
    return Padding(
      padding: EdgeInsets.only(right: 20.w),
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
