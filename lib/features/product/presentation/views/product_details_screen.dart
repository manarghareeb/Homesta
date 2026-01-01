import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:homesta/core/routing/app_router.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/theming/styles.dart';
import 'package:homesta/core/widgets/custom_app_bar_widget.dart';
import 'package:homesta/features/product/presentation/widgets/comment_on_product_section.dart';
import 'package:homesta/features/home/presentation/widgets/count_container.dart';
import 'package:homesta/features/product/presentation/widgets/product_description_section.dart';
import 'package:homesta/features/product/presentation/widgets/product_image_galary_section.dart';
import 'package:homesta/features/product/presentation/widgets/product_rating_section.dart';
import 'package:homesta/features/product/presentation/widgets/product_title_with_rating.dart';
import 'package:homesta/features/product/presentation/widgets/reviews_and_view_all_section.dart';
import 'package:homesta/features/product/presentation/widgets/select_color_section.dart';
import 'package:homesta/features/product/presentation/widgets/suggest_for_you_section.dart';
import 'package:homesta/features/home/presentation/widgets/dual_action_buttons.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.soLightGreyColor,

      appBar: CustomAppBarWidget(
        backgroundColor: ColorManager.soLightGreyColor,
        text: 'Product Details',
        actions: [
          IconButton(icon: const Icon(Icons.favorite_border), onPressed: () {}),
        ],
      ),

      /// ✅ FIXED BODY
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                const ProductImageGallerySection(
                  mainImage: 'assets/images/chair.png',
                  thumbnails: [
                    'assets/images/chair.png',
                    'assets/images/chair.png',
                    'assets/images/chair.png',
                    'assets/images/chair.png',
                  ],
                ),

                SizedBox(height: 24.h),
                const ProductTitleWithRating(),
                SizedBox(height: 20.h),
                const ProductDescriptionSection(),
                SizedBox(height: 16.h),

                SelectColorSection(
                  selectedColorName: 'Green',
                  onColorSelected: (color) {},
                ),

                SizedBox(height: 16.h),
                CountContainer(
                  padding: EdgeInsets.symmetric(
                    vertical: 8.h,
                    horizontal: 12.w,
                  ),
                ),

                SizedBox(height: 12.h),
                ReviewsAndViewAllSection(isVisible: false, onTap: () {}),

                SizedBox(height: 16.h),
                const ProductRatingSection(),

                SizedBox(height: 24.h),
                const CommentOnProductSection(),

                SizedBox(height: 24.h),
                Text(
                  'Suggest For You',
                  style: TextStyles.font18BlackW500.copyWith(
                    color: ColorManager.primaryColor,
                  ),
                ),

                SizedBox(height: 12.h),
                const SuggestForYouSection(),

                SizedBox(height: 120.h), // 👈 مساحة للبوتوم بار
              ]),
            ),
          ),
        ],
      ),

      /// ✅ Bottom Fixed Buttons
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          child: DualActionButtons(
            leftText: 'Add to Cart',
            rightText: 'Buy Now',
            onLeftPressed: () {},
            onRightPressed: () {
              GoRouter.of(context).push(AppRouter.orderFlowScreen);
            },
          ),
        ),
      ),
    );
  }
}
