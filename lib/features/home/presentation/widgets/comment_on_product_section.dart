import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/theming/styles.dart';

class CommentOnProductSection extends StatelessWidget {
  const CommentOnProductSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 85.h,
                width: 100.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.r),
                  border: Border.all(color: ColorManager.brounColor),
                  color: Colors.white,
                ),
                child: Image.asset('assets/images/chair.png'),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Modern Chair', 
                      style: TextStyles.font16BlackRegular.copyWith(
                        fontSize: 14.sp
                    )),
                    SizedBox(height: 4.h),
                    Text(
                      'Wooow it’s very nice and suitable to my living room.I recommended it to anyone who wants to buy it.', 
                      style: TextStyles.font12GreyColorW400.copyWith(
                        color: ColorManager.blackColor,
                      )),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.thumb_up_outlined, color: ColorManager.greyColor, size: 16.sp),
                  SizedBox(width: 8.w),
                  Text('Helpful(10)', style: TextStyles.font12GreyColorW400),
                ],
              ),
              Text('Nov.20 .2025', style: TextStyles.font12GreyColorW400),
            ],
          ),
        ],
      ),
    );
  }
}