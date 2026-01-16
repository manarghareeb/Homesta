import 'package:flutter/material.dart';
import 'package:homesta/core/theming/styles.dart';
import 'package:homesta/features/product/domain/entities/review_entity.dart';
import 'package:homesta/features/product/presentation/widgets/rating_star.dart';

class ReviewItem extends StatelessWidget {
  const ReviewItem({super.key, required this.review});
  final ReviewEntity review;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 5,
        children: [
          Text(review.userName, style: TextStyles.font16BlackRegular),
          /*Row(
            spacing: 5,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                timeago.format(review.reviewDate),
                style: TextStyles.font16GreyRegular,
              ),
            ],
          ),*/
          Text(review.comment, style: TextStyles.font15GreyColorW400),
          Row(
            children: [
              RatingStar(rating: review.rating.toDouble()),
              SizedBox(width: 4,),
              Text(
                review.rating.toString(),
                style: TextStyles.font16BlackRegular,
              ),
            ],
          ),
          // ReviewPhotoList()
        ],
      ),
    );
  }
}
