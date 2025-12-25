import 'package:flutter/material.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/theming/styles.dart';
import 'package:homesta/features/product/presentation/widgets/add_review_section.dart';
import 'package:homesta/features/product/presentation/widgets/explore_product.dart';
import 'package:homesta/features/product/presentation/widgets/rating_star.dart';
import 'package:homesta/features/product/presentation/widgets/review_list.dart';
import 'package:homesta/features/product/presentation/widgets/reviews_and_view_all_section.dart';

class ReviewTab extends StatefulWidget {
  const ReviewTab({super.key});

  @override
  State<ReviewTab> createState() => _ReviewTabState();
}

class _ReviewTabState extends State<ReviewTab> {
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
              spacing: 5,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ReviewsAndViewAllSection(isVisible: isVisible,onTap: () {
            setState(() {
              isVisible = !isVisible;
            });
          },),
          Visibility(
            visible: isVisible,
            child: Column(
              children: [
                Row(
                  children: [
                    Column(
                      children: [
                        Text("4.8", style: TextStyles.font18BlackW500),
                        
                        RatingStar(),
                        Text("(110 Reviews)", style: TextStyles.font13LightGreyW500),
                      ],
                    ),
                    SizedBox(width: 50),
                    Expanded(
                      child: Column(
                        children: [
                          buildRatingBar(1, 1),
                          buildRatingBar(2, 0.5),
                          buildRatingBar(3, 0.2),
                          buildRatingBar(4, 0.1),
                          buildRatingBar(5, 0.1),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(color: Color(0xffE0DFDF), height: 2),
                ReviewList(), 
                Container(color: Color(0xffE0DFDF), height: 2),
              ],
            ),
          ),
      
          AddReviewSection(),
          SizedBox(height: 10,),
          ExploreProduct()
        ],
      ),
    );
  }
}

Widget buildRatingBar(int label, double percentage) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 2.0),
    child: Row(
      children: [
        Text('$label', style: TextStyles.font16BlackW500),
        const SizedBox(width: 12),
        Expanded(
          child: LinearProgressIndicator(
            value: percentage,
            backgroundColor: ColorManager.lightGreyColor,
            color: ColorManager.primaryColor, // The dark teal from your UI
            minHeight: 6,
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ],
    ),
  );
}
