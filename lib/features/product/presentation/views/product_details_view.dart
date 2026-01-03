import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/widgets/custom_app_bar_widget.dart';
import 'package:homesta/features/product/domain/entities/product_entitty.dart';
import 'package:homesta/features/product/presentation/widgets/addtional_info_tab.dart';
import 'package:homesta/features/home/presentation/widgets/count_container.dart';
import 'package:homesta/features/product/presentation/widgets/discription_tab.dart';
import 'package:homesta/features/product/presentation/widgets/product_description_section.dart';
import 'package:homesta/features/product/presentation/widgets/product_image_galary_section.dart';
import 'package:homesta/features/product/presentation/widgets/product_title_with_rating.dart';
import 'package:homesta/features/product/presentation/widgets/review_tab.dart';
import 'package:homesta/features/product/presentation/widgets/select_color_section.dart';
import 'package:homesta/features/product/presentation/widgets/tap_bar_widget.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key, required this.productEntity});
final ProductEntity productEntity;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: CustomAppBarWidget(
          backgroundColor: ColorManager.soLightGreyColor,
          text: 'Product Details',
          actions: [
            IconButton(
              onPressed: () {},
              icon: CircleAvatar(
                backgroundColor: Colors.white,
                child: const Icon(
                  Icons.favorite_outline,
                  color: ColorManager.primaryColor,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: ColorManager.soLightGreyColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                SizedBox(height: 24.h),
                 ProductDescriptionSection(description: productEntity.description,price: productEntity.price.toString(),),
                SizedBox(height: 16.h),
                SelectColorSection(
                  selectedColorName: 'Green',
                  onColorSelected: (color) {
                    print('Selected color: $color');
                  },
                ),
                SizedBox(height: 16.h),
                CountContainer(
                  padding: EdgeInsets.symmetric(
                    vertical: 7.4.h,
                    horizontal: 11.5.w,
                  ),
                ),
                SizedBox(height: 8.h),
                TapBarWidget(),

                /// محتوى التابات
                SizedBox(
                  height: 500.h,
                  child:  TabBarView(
                    children: [
                      DiscriptionTab(),
                      AddtionalInfoTab(),
                      ReviewTab(productEntity: productEntity,),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      
       
        
      ),
    );
  }
}
