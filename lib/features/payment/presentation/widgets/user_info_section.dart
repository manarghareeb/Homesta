import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/core/theming/styles.dart';

class UserInfoSection extends StatelessWidget {
  const UserInfoSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 40.r,
          backgroundImage: const AssetImage(
            'assets/images/image 1.png',
          ),
        ),
        SizedBox(width: 8.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Maram Ahmed',
              style: TextStyles.font14BlackColorW400,
            ),
            Row(
              children: [
                Icon(Icons.location_on_outlined, size: 14.w),
                SizedBox(width: 4.w),
                Text(
                  'Cairo, Egypt',
                  style: TextStyles.font14BlackColorW400,
                ),
              ],
            ),
            Row(
              children: [
                Icon(Icons.access_time, size: 14.w),
                SizedBox(width: 4.w),
                Text(
                  'Nov 23 - 22:00',
                  style: TextStyles.font14BlackColorW400,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
