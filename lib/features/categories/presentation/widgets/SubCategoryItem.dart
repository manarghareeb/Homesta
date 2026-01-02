import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/core/theming/styles.dart';
import 'package:homesta/core/widgets/custom_cached_network_image.dart';

class SubCategoryItem extends StatelessWidget {
  final String title;
  final String image;
  final VoidCallback onTap;

  const SubCategoryItem({
    super.key,
    required this.title,
    required this.image,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: CustomCachedNetworkImage(
                imagePath: image,
                height: 56.h,
                width: 56.w,
              ),
            ),
            SizedBox(width: 14.w),
            Expanded(child: Text(title, style: TextStyles.font16BlackRegular)),
            const Icon(Icons.chevron_right, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
