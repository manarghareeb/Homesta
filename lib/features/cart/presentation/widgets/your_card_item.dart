import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/theming/styles.dart';
import 'package:homesta/features/home/presentation/widgets/count_container.dart';

class YourCardItem extends StatelessWidget {
  const YourCardItem({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15.r),
            child: Image.asset(
              'assets/images/image 1.png',
              width: 137.w,
              height: 111.h,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Modern Chair', style: TextStyles.font16BlackRegular),
                SizedBox(height: 8.h),
                RichText(
                  text: TextSpan(
                    text: 'Color: ',
                    style: TextStyles.font14BlackColorW400,
                    children: [
                      TextSpan(
                        text: 'Grey',
                        style: TextStyles.font14GreyColorW400,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 12.h),
                const CountContainer(),
              ],
            ),
          ),
          SizedBox(width: 12.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              IconButton(
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                icon: Icon(Icons.delete, color: ColorManager.greyColor),
                onPressed: () {},
              ),
              SizedBox(height: 15.h),
              Text('\$200', style: TextStyles.font14BlackColorW400),
            ],
          ),
        ],
      ),
    );
  }
}
