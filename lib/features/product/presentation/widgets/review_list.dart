import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homesta/features/product/presentation/cubits/review_cubit/review_cubit.dart';
import 'package:homesta/features/product/presentation/cubits/review_cubit/review_state.dart';
import 'package:homesta/features/product/presentation/widgets/review_item.dart';
import 'package:homesta/features/product/presentation/widgets/skeltonizer_review_list.dart';

class ReviewList extends StatelessWidget {
  const ReviewList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReviewsCubit, ReviewsState>(
      builder: (context, state) {
        if (state is ReviewsLoading) {
          return const Center(child: SkeltonizerReviewList());
        } else if (state is ReviewsFailure) {
          return Center(child: Text(state.message));
        } else if (state is ReviewsSuccess) {
          if (state.reviews.isEmpty) {
            return const Center(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("No reviews found!"),
              ),
            );
          }

          return ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: state.reviews.length,
            separatorBuilder:
                (context, index) =>
                    Container(color: Color(0xffE0DFDF), height: 2),
            itemBuilder: (context, index) {
              return ReviewItem(review: state.reviews[index]);
            },
          );
        }
        return Text("opps something went wrong!");
      },
    );
  }
}
