import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/theming/styles.dart';

class YourCardItem extends StatefulWidget {
  const YourCardItem({super.key});

  @override
  State<YourCardItem> createState() => _YourCardItemState();
}

class _YourCardItemState extends State<YourCardItem> {
  @override
  Widget build(BuildContext context) {
    int quantity = 1;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15.r),
            child: Image.asset(
              'assets/images/image 3.png',
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
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    border: Border.all(color: ColorManager.lightGreyColor),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (quantity > 1) setState(() => quantity--);
                        },
                        child: Icon(Icons.remove, size: 18.sp),
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        quantity.toString(),
                        style: TextStyles.font13BlackW500.copyWith(
                          fontSize: 15.sp,
                        ),
                      ),
                      SizedBox(width: 8.w),
                      GestureDetector(
                        onTap: () => setState(() => quantity++),
                        child: Icon(Icons.add, size: 18.sp),
                      ),
                    ],
                  ),
                ),
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
