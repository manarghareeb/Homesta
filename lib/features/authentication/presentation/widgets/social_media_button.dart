import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SocialMediaButton extends StatelessWidget {
  const SocialMediaButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {},
          child: SvgPicture.asset(
            'assets/images/material-icon-theme_google.svg',
            width: 32.w,
            height: 32.h,
          ),
        ),
        SizedBox(width: 48.w),
        InkWell(
          onTap: () {},
          child: SvgPicture.asset(
            'assets/images/logos_facebook.svg',
            width: 32.w,
            height: 32.h,
          ),
        ),
        SizedBox(width: 48.w),
        InkWell(
          onTap: () {},
          child: SvgPicture.asset(
            'assets/images/Vector.svg',
            width: 32.w,
            height: 32.h,
          ),
        ),
      ],
    );
  }
}
