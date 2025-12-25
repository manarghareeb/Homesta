import 'package:flutter/material.dart';
import 'package:homesta/features/product/presentation/widgets/review_item.dart';

class ReviewList extends StatelessWidget {
  const ReviewList({super.key});

  @override
  Widget build(BuildContext context) {
    return  ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 2,
      separatorBuilder: (context, index) => Container(color: Color(0xffE0DFDF),height:2 ,),
      itemBuilder: (context, index) {
        return ReviewItem();
      },
    );
  }
}