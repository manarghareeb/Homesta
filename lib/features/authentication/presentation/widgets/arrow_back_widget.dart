import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:homesta/core/theming/colors.dart';

class ArrowBackWidget extends StatelessWidget {
  const ArrowBackWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.topStart,
      child: Padding(
        padding: EdgeInsets.only(top: 16.h, left: 16.w),
        child: Container(
          width: 28.w,
          height: 28.h,
          decoration: BoxDecoration(
            color: ColorManager.mainColor,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Center(
            child: InkWell(
              borderRadius: BorderRadius.circular(10.r),
              onTap: () => GoRouter.of(context).pop(),
              child: Icon(Icons.arrow_back_ios, size: 16.sp),
            ),
          ),
        ),
      ),
    );
  }
}
