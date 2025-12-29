import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/theming/styles.dart';

class SendMessageWidget extends StatelessWidget {
  const SendMessageWidget({
    super.key,
    required this.controller,
    required this.onSend,
  });

  final TextEditingController controller;
  final VoidCallback onSend;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 6)],
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                suffixIcon: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: onSend,
                      child: Container(
                        width: 26.w,
                        height: 26.w,
                        margin: EdgeInsets.only(right: 8.w, left: 12.w),
                        decoration: BoxDecoration(
                          color: ColorManager.lightGreyIconColor,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.mic_none,
                          color: Colors.white,
                          size: 20.sp,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: onSend,
                      child: Container(
                        width: 32.w,
                        height: 32.w,
                        margin: EdgeInsets.only(right: 8.w, left: 12.w),
                        decoration: BoxDecoration(
                          color: ColorManager.lightGreyIconColor,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Icon(
                          Icons.send,
                          color: Colors.white,
                          size: 20.sp,
                        ),
                      ),
                    ),
                  ],
                ),

                prefixIcon: Container(
                  width: 24.w,
                  height: 24.h,
                  margin: EdgeInsets.only(left: 12.w, right: 8.w),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        ColorManager.startchatColor,
                        ColorManager.primaryColor,
                      ],
                      stops: [0.0, 0.9],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    color: Color(0xFF004D40),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.add, color: Colors.white),
                ),
                hintText: "Ask anything",
                hintStyle: TextStyles.font15BlackW400,
                filled: true,
                fillColor: ColorManager.aliceBlue,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.r),
                  borderSide: BorderSide.none,
                ),
              ),
              onSubmitted: (_) => onSend(),
            ),
          ),
        ],
      ),
    );
  }
}
