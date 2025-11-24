import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/theming/styles.dart';
import 'package:homesta/core/widgets/custom_app_bar_widget.dart';
import 'package:homesta/features/home/presentation/widgets/comment_on_product_section.dart';
import 'package:homesta/features/home/presentation/widgets/product_rating_section.dart';
import 'package:homesta/features/home/presentation/widgets/reviews_and_view_all_section.dart';
import 'package:homesta/features/home/presentation/widgets/suggest_for_you_section.dart';
import 'package:homesta/features/home/presentation/widgets/total_price_add_to_card_section.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(
        backgroundColor: ColorManager.mainColor,
        textColor: ColorManager.brounColor,
        text: 'Product Details',
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite_outline),
          ),
        ],
      ),
      backgroundColor: ColorManager.mainColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset('assets/images/chair.png'),
              SizedBox(height: 24.h),
              Wrap(
                spacing: 24.w,
                runSpacing: 8.h,
                children: List.generate(4, (index) {
                  return Container(
                    height: 70.h,
                    width: 70.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.r),
                      color: Colors.white,
                      border: Border.all(color: ColorManager.brounColor),
                    ),
                    child: Image.asset('assets/images/chair.png'),
                  );
                }),
              ),
              SizedBox(height: 24.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Modern Chair', style: TextStyles.font18BlackW500),
                  Row(
                    children: [
                      Icon(Icons.star, color: Color(0xFFFFCC00), size: 20.sp),
                      SizedBox(width: 2.w),
                      Text('4.9', style: TextStyles.font18BlackW500),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              RichText(
                text: TextSpan(
                  text: 'Select Color :',
                  style: TextStyles.font18BlackW500,
                  children: [
                    TextSpan(
                      text: 'Green',
                      style: TextStyles.font18BlackW500.copyWith(
                        color: ColorManager.greenColor,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 8.h),
              Wrap(
                spacing: 8.w,
                children: List.generate(4, (index) {
                  return Container(
                    height: 24.h,
                    width: 24.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color:
                          index == 0
                              ? ColorManager.greenColor
                              : index == 1
                              ? ColorManager.brounColor
                              : index == 2
                              ? ColorManager.orderColor
                              : ColorManager.greyColor,
                    ),
                  );
                }),
              ),
              SizedBox(height: 16.h),
              Text('Product Details ', style: TextStyles.font16GreyRegular),
              SizedBox(height: 16.h),
              Text(
                'Lorem ipsum dolor sit amet consectetur. Nec aliquam morbi lacus habitasse amet. Nunc dui dictum facilisi faucibus amet sitaliquam morbi lacus habitasse amet. Nunc dui dictum facilisi faucibus amet sit',
                style: TextStyles.font16GreyRegular,
              ),
              SizedBox(height: 24.h),
              const TotalPriceAndAddToCardSection(),
              SizedBox(height: 24.h),
              const ReviewsAndViewAllSection(),
              SizedBox(height: 16.h),
              const ProductRatingSection(),
              SizedBox(height: 24.h,),
              const CommentOnProductSection(),
              SizedBox(height: 16.h),
              Text('Suggest For You', style: TextStyles.font18BlackW500.copyWith(
                color: ColorManager.brounColor
              )),
              SizedBox(height: 16.h),
              const SuggestForYouSection(),
              SizedBox(height: 32.h),
            ],
          ),
        ),
      ),
    );
  }
}
