import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/core/theming/styles.dart';
import 'package:homesta/features/home/presentation/widgets/progress_item.dart';

class ProductRatingSection extends StatelessWidget {
  const ProductRatingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
                padding: EdgeInsets.all(16.r),
                decoration: BoxDecoration(
                  color: Color(0xFFB19470),
                  borderRadius: BorderRadius.circular(15.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text('5.00', style: TextStyles.font14MainColorW400),
                        SizedBox(width: 5.w),
                        Text('⭐⭐⭐⭐⭐', style: TextStyles.font16BlackRegular),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      'Did the item fit well?',
                      style: TextStyles.font14MainColorW400,
                    ),
                    SizedBox(height: 8.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ProgressItem(
                          label: 'Small', 
                          value: 0, 
                          percentText: '0%',
                        ),
                        SizedBox(width: 35.w),
                        ProgressItem(
                          label: 'True to size', 
                          value: 1, 
                          percentText: '100%',
                        ),
                        SizedBox(width: 35.w,),
                        ProgressItem(
                          label: 'Large', 
                          value: 0, 
                          percentText: '0%',
                        ),
                      ],
                    ),
                  ],
                ),
              );
  }
}
