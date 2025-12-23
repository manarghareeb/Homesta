import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/theming/styles.dart';

class HelpCategoryWidget extends StatelessWidget {
  final String title;
  final String description;
  final String? imagePath;

  const HelpCategoryWidget({
    super.key,
    required this.title,
    required this.description,
    this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xffF6F6F6),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
        side: const BorderSide(
          color: Color(0xffF6F6F6),
        ),
      ),
      elevation: 0,
      child: Padding(
        padding: EdgeInsets.all(12.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (imagePath != null) ...[
              SvgPicture.asset(
                imagePath!,
                width: 24.w,
                height: 24.w,
                fit: BoxFit.contain,
              ),
              SizedBox(height: 12.h),
            ],
            Text(title, style: TextStyles.font16BlackW500, textAlign: TextAlign.center),
            SizedBox(height: 4.h),
            Text(description, style: TextStyles.font14BlackColorW400, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
