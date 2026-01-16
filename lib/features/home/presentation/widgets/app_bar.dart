import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:homesta/core/routing/app_router.dart';
import 'package:homesta/core/theming/colors.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      elevation: 0,
      leading: Text(''),
      title: Row(
        children: [
          Image.asset('assets/images/logo.png', height: 28,width: 28,),

          SizedBox(width: 8.w),

          Expanded(
            child: Text(
              'Homesta',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: ColorManager.primaryColor,
              ),
            ),
          ),
        ],
      ),

      actions: [
        IconButton(
          icon: Icon(
            Icons.notifications_none,
            color: ColorManager.lightGreyColor,
          ),
          onPressed: () {
            context.push(AppRouter.cartScreen);
          },
        ),
        IconButton(
          icon: Icon(Icons.favorite_border, color: ColorManager.lightGreyColor),
          onPressed: () {
            context.push(AppRouter.notificationScreen);
          },
        ),
        SizedBox(width: 8.w),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
