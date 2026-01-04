import 'package:flutter/material.dart';
import 'package:homesta/features/product/domain/entities/review_entity.dart';
import 'package:homesta/features/product/presentation/widgets/review_item.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SkeltonizerReviewList extends StatelessWidget {
  const SkeltonizerReviewList({super.key});

  @override
  Widget build(BuildContext context) {
        final  fakeReviews =
        List.generate(4, (index) => ReviewEntity(reviewId: 1, comment: "comment", rating: 4, reviewDate: DateTime.now(), userName: "userName", productName: "productName", storeName: "storeName"));
    return Skeletonizer(
      enabled: true,
      child: ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 4,
            separatorBuilder: (context, index) => Container(color: Color(0xffE0DFDF),height:2 ,),
            itemBuilder: (context, index) {
              return ReviewItem(review: fakeReviews[index] ,);
            },
          ),
    );
  }
}