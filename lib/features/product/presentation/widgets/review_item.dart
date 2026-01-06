import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/core/theming/styles.dart';
import 'package:homesta/features/product/domain/entities/review_entity.dart';
import 'package:homesta/features/product/presentation/widgets/rating_star.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:timeago/timeago.dart' as timeago;

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
          Row(
            spacing: 5,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Skeleton.leaf(
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/image 1.png'),
                  radius: 30,
                ),
              ),
              Text(review.userName, style: TextStyles.font16BlackRegular),
              Spacer(),
              SizedBox(
                width: 111.w,
                child: Text(
                  timeago.format(review.reviewDate),
                  style: TextStyles.font16GreyRegular,
                ),
              ),
            ],
          ),
          Text(review.comment, style: TextStyles.font14GreyColorW400),
          Row(
            children: [
              RatingStar(rating: review.rating.toDouble()),
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
