import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theming/styles.dart';

class RatingBreakdownCard extends StatelessWidget {
  const RatingBreakdownCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xffF6F6F6),
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Rating Breakdown", style: TextStyles.font18BoldBlack),
            SizedBox(height: 8.h),
            Text(
              "Average Rating: ⭐ 3.1 ",
              style: TextStyles.font14GreyColorW400,
            ),

            SizedBox(height: 16.h),

            _buildRatingRow("5 ★", 0),
            _buildRatingRow("4 ★", 1000),
            _buildRatingRow("3 ★", 456),
            _buildRatingRow("2 ★", 100),
            _buildRatingRow("1 ★", 10),
          ],
        ),
      ),
    );
  }

  Widget _buildRatingRow(String label, int count) {
    double maxCount = 1000; //أ
    double barWidth = (count / maxCount) * 150.w;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Row(
        children: [
          SizedBox(
            width: 40.w,
            child: Text(label, style: TextStyles.font14BlackColorW400),
          ),
          SizedBox(width: 8.w),
          Container(height: 8.h, width: barWidth, color: Colors.amber),
          SizedBox(width: 8.w),
          Text("($count)", style: TextStyles.font14GreyColorW400),
        ],
      ),
    );
  }
}
