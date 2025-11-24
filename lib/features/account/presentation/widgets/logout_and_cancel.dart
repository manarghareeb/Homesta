import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/theming/styles.dart';

class LogOutAndCancel extends StatelessWidget {
  const LogOutAndCancel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: ColorManager.mainColor,
              foregroundColor: Colors.black,
              padding: EdgeInsets.symmetric(
                horizontal: 32.w,
                vertical: 12.h,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.r),
              ),
            ),
            onPressed: () {
              GoRouter.of(context).pop();
            },
            child: Text(
              'Cancel',
              style: TextStyles.font16WhiteW500.copyWith(
                color: Color(0xFF76453B),
              ),
            ),
          ),
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Color(0xFFFAF0E6),
              foregroundColor: Colors.black,
              padding: EdgeInsets.symmetric(
                horizontal: 32.w,
                vertical: 12.h,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.r),
              ),
            ),
            onPressed: () {},
            child: Text(
              'Log out',
              style: TextStyles.font16WhiteW500.copyWith(
                color: Color(0xFF76453B),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
