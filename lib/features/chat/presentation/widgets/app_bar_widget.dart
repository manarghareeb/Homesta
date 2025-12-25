
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/theming/styles.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key, this.openDrawer});
  final Function()? openDrawer;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 16.w),
        GestureDetector(
          onTap: (){
            Navigator.of(context).pop();
          },
          child: Icon(
            FontAwesomeIcons.arrowLeft, 
            color: ColorManager.primaryColor, 
            size: 18.sp
          )
        ),
        SizedBox(width: 8.w),
        CircleAvatar(
          backgroundColor: ColorManager.primaryColor,
          radius: 12.sp,
          child: Icon(FontAwesomeIcons.robot, color: Colors.white, size: 12.sp),
        ),
        SizedBox(width: 8.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'AI Assistant',
              style: TextStyles.font15BlackW400.copyWith(
                color: ColorManager.primaryColor,
              ),
            ),
            Row(
              children: [
                Icon(Icons.circle, color: Color(0xFF1DC731), size: 10.sp),
                SizedBox(width: 4.w),
                Text('Online', style: TextStyles.font14PrimaryColorW400),
              ],
            ),
          ],
        ),
        SizedBox(width: 17.w),
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
        Text('Temporary Chat', style: TextStyles.font14GreyColorW400),
        SizedBox(width: 7.w),
        GestureDetector(
          onTap: openDrawer,
          child: SvgPicture.asset('assets/images/chat_ai_icon.svg'),
        ),
      ],
    );
  }
}
