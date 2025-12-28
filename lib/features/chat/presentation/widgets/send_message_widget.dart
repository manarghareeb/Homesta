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
                hintText: "Ask anything",
                hintStyle: TextStyles.font15BlackW400,
                filled: true,
                fillColor: ColorManager.aliceBlue,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.r),
                  borderSide: BorderSide.none,
                ),

                /// ✅ FIXED SUFFIX ICON
                suffixIcon: SizedBox(
                  width: 80.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: onSend,
                        child: Container(
                          width: 26.w,
                          height: 26.w,
                          decoration: BoxDecoration(
                            color: ColorManager.lightGreyIconColor,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.mic_none,
                            color: Colors.white,
                            size: 18.sp,
                          ),
                        ),
                      ),
                      SizedBox(width: 8.w),
                      GestureDetector(
                        onTap: onSend,
                        child: Container(
                          width: 32.w,
                          height: 32.w,
                          decoration: BoxDecoration(
                            color: ColorManager.lightGreyIconColor,
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: Icon(
                            Icons.send,
                            color: Colors.white,
                            size: 18.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                prefixIcon: Container(
                  margin: EdgeInsets.only(left: 8.w, right: 8.w),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        ColorManager.startchatColor,
                        ColorManager.primaryColor,
                      ],
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.add, color: Colors.white),
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
