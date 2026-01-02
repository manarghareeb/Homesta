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
    return LayoutBuilder(
      builder: (context, constraints) {
        final isSmall = constraints.maxWidth < 360;

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
          child: Row(
            children: [
              /// BACK
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

              /// AVATAR
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

              /// TITLE + STATUS
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'AI Assistant',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyles.font15BlackW400.copyWith(
                        color: ColorManager.primaryColor,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.circle,
                          color: const Color(0xFF1DC731),
                          size: 8.sp,
                        ),
                        SizedBox(width: 4.w),
                        Text(
                          'Online',
                          style: TextStyles.font14PrimaryColorW400,
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              /// ACTION ICONS (hide on small screens)
              if (!isSmall) ...[
                IconButton(
                  icon: Icon(Icons.dark_mode_outlined),
                  onPressed: () {},
                ),
                Icon(
                  FontAwesomeIcons.message,
                  color: ColorManager.greyColor,
                  size: 18.sp,
                ),
              ],

              SizedBox(width: 6.w),

              GestureDetector(
                onTap: openDrawer,
                child: SvgPicture.asset(
                  'assets/images/chat_ai_icon.svg',
                  height: 22.h,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
