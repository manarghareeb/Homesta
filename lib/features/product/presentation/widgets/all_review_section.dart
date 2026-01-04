import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:homesta/core/theming/styles.dart';
import 'package:homesta/features/product/presentation/cubits/review_cubit/review_cubit.dart';
import 'package:homesta/features/product/presentation/cubits/review_cubit/review_state.dart';
import 'package:homesta/features/product/presentation/widgets/skeletonizer_all_review_section.dart';
import 'rating_star.dart';
import 'review_tab.dart';

class AllReviewSection extends StatelessWidget {
  const AllReviewSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReviewsCubit, ReviewsState>(
      builder: (context, state) {
        if (state is ReviewsLoading) {
          return const Center(child: SkeletonizerAllReviewSection());
        }

        if (state is ReviewsFailure) {
          return Center(
            child: Text(state.message),
          );
        }

        if (state is ReviewsSuccess) {
          final reviews = state.reviews;

          if (reviews.isEmpty) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: const Text('No reviews yet'),
            );
          }

          /// ⭐ average rating
          final averageRating =
              reviews.map((e) => e.rating).reduce((a, b) => a + b) /
                  reviews.length;

          /// ⭐ rating distribution
          double ratingPercent(int star) {
            final count =
                reviews.where((r) => r.rating == star).length;
            return count / reviews.length;
          }

          return Row(
            children: [
              /// LEFT
              Column(
                children: [
                  Text(
                    averageRating.toStringAsFixed(1),
                    style: TextStyles.font18BlackW500,
                  ),
                  RatingStar(rating: averageRating),
                  Text(
                    '(${reviews.length} Reviews)',
                    style: TextStyles.font13LightGreyW500,
                  ),
                ],
              ),

              const SizedBox(width: 50),

              /// RIGHT
              Expanded(
                child: Column(
                  children: [
                    buildRatingBar(5, ratingPercent(5)),
                    buildRatingBar(4, ratingPercent(4)),
                    buildRatingBar(3, ratingPercent(3)),
                    buildRatingBar(2, ratingPercent(2)),
                    buildRatingBar(1, ratingPercent(1)),
                  ],
                ),
              ),
            ],
          );
        }

        return const SizedBox();
      },
    );
  }
}
