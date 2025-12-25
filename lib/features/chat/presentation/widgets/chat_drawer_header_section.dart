import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/core/theming/styles.dart';

class ChatDrawerHeaderSection extends StatelessWidget {
  const ChatDrawerHeaderSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(Icons.add_comment_outlined),
            SizedBox(width: 8.w),
            Text("New Chat", style: TextStyles.font15BlackW500),
          ],
        ),
        SizedBox(height: 16.h),
        Row(
          children: [
            const Icon(Icons.search),
            SizedBox(width: 8.w),
            Text(
              "Search Chats",
              style: TextStyles.font15BlackW500,
            ),
          ],
        ),
        SizedBox(height: 16.h),
        Row(
          children: [
            const Icon(Icons.image_outlined),
            SizedBox(width: 8.w),
            Text("Images", style: TextStyles.font15BlackW500),
          ],
        ),
        SizedBox(height: 24.h),
        Text(
          "Your Chats",
          style: TextStyles.font14GreyColorW400.copyWith(
            fontSize: 18.sp,
            color: Color(0xFF8C8F98)
          ),
        ),
      ],
    );
  }
}
