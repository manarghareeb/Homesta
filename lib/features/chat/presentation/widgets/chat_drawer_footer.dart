import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/theming/styles.dart';

class ChatDrawerFooter extends StatelessWidget {
  const ChatDrawerFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(color: Color(0xFFDBE2FD), width: 1.w),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 12,
                offset: const Offset(0, 6),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.all(0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(color: Color(0xFFDBE2FD), width: 1.w),
            color: ColorManager.aliceBlue,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 24.0),
            child: Row(
              children: [
                Container(
                  width: 32.w,
                  height: 32.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [
                        ColorManager.startchatColor,
                        ColorManager.primaryColor,
                      ],
                      stops: [0.0, 0.9],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Icon(Icons.person, color: Colors.white, size: 24.sp),
                ),
                SizedBox(width: 12.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Maram Ahmed", style: TextStyles.font15BlackW500),
                    Text("Free", style: TextStyles.font15BlackW400),
                  ],
                ),
                const Spacer(),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 24.w,
                    vertical: 8.h,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFC7D2FF),
                    borderRadius: BorderRadius.circular(25.r),
                  ),
                  child: Text(
                    "Upgrade",
                    style: TextStyles.font14BlackColorW500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
