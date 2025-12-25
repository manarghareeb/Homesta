import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:homesta/core/routing/app_router.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/theming/styles.dart';

class StartChatButton extends StatelessWidget {
  const StartChatButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.chatMessageScreen);
      },
      child: Container(
        width: 219.w,
        height: 48.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(color: Colors.white, width: 2.w),
          gradient: LinearGradient(
            colors: [
              ColorManager.startchatColor,
              ColorManager.primaryColor,
            ],
            stops: [0.2, 1.0],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: ColorManager.primaryColor.withOpacity(0.3),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              FontAwesomeIcons.comment,
              color: Colors.white,
              size: 20.sp,
            ),
            SizedBox(width: 8.w),
            Text(
              "Start Chat",
              style: TextStyles.font14WhiteColorW400,
            ),
          ],
        ),
      ),
    );
  }
}
