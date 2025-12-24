import 'package:flutter/material.dart';
import 'package:homesta/core/theming/styles.dart';
import 'package:homesta/features/product/presentation/widgets/rating_star.dart';

class ReviewItem extends StatelessWidget {
  const ReviewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        spacing: 5,
        children: [
          Row(
            spacing: 5,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
                      CircleAvatar(
            backgroundImage:  AssetImage('assets/images/image 1.png'),
            radius: 30,
          ),
          Text("Hend Mohamed",style: TextStyles.font16BlackRegular,),
          Spacer(),
          Text("3 months ago",style: TextStyles.font16GreyRegular,),
            ],
          ),
          Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor ,",style: TextStyles.font14GreyColorW400,),
        Row(
          children: [
            RatingStar(),
            Text("4.8",style: TextStyles.font16BlackRegular,)
          ],
        )
        ],
      ),
    );
  }
}