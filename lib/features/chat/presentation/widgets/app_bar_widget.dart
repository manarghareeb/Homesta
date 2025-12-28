import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:homesta/core/routing/app_router.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/theming/styles.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key, this.openDrawer});
  final Function()? openDrawer;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        child: Row(
          children: [
            /// Back icon
            GestureDetector(
              onTap: () {
                GoRouter.of(context).pushReplacement(AppRouter.homeScreen);
              },
              child: Icon(
                FontAwesomeIcons.arrowLeft,
                color: ColorManager.primaryColor,
                size: 18.sp,
              ),
            ),

            SizedBox(width: 8.w),

            /// Bot icon
            CircleAvatar(
              backgroundColor: ColorManager.primaryColor,
              radius: 12.sp,
              child: Icon(
                FontAwesomeIcons.robot,
                color: Colors.white,
                size: 12.sp,
              ),
            ),

            SizedBox(width: 8.w),

            /// 🔥 THIS IS THE FIX
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'AI Assistant',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyles.font15BlackW400.copyWith(
                      color: ColorManager.primaryColor,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(Icons.circle, color: Color(0xFF1DC731), size: 8.sp),
                      SizedBox(width: 4.w),
                      Text(
                        'Online',
                        style: TextStyles.font14PrimaryColorW400,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            /// Right icons
            Row(
              children: [
                Material(
                  elevation: 6,
                  shape: const CircleBorder(),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 12.sp,
                    child: Icon(
                      Icons.dark_mode_outlined,
                      color: Colors.black,
                      size: 18.sp,
                    ),
                  ),
                ),
                SizedBox(width: 8.w),
                Icon(
                  FontAwesomeIcons.message,
                  color: ColorManager.greyColor,
                  size: 18.sp,
                ),
                SizedBox(width: 8.w),
                GestureDetector(
                  onTap: openDrawer,
                  child: SvgPicture.asset(
                    'assets/images/chat_ai_icon.svg',
                    width: 22.w,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
