import 'package:flutter/material.dart';
import 'package:homesta/core/theming/styles.dart';
import 'package:homesta/features/product/presentation/widgets/rating_star.dart';
import 'package:homesta/features/product/presentation/widgets/review_tab.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SkeletonizerAllReviewSection extends StatelessWidget {
  const SkeletonizerAllReviewSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: Row(
        children: [
          /// LEFT
          Column(
            children: [
              Text("1", style: TextStyles.font18BlackW500),
              RatingStar(rating: 4),
              Text('(${'0'} Reviews)', style: TextStyles.font13LightGreyW500),
            ],
          ),

          const SizedBox(width: 50),

          /// RIGHT
          Expanded(
            child: Column(
              children: [
                buildRatingBar(1, 0),
                buildRatingBar(2, 0),
                buildRatingBar(3, 0),
                buildRatingBar(4, 0),
                buildRatingBar(5, 0),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
