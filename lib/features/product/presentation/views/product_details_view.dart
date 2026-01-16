import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:homesta/core/routing/app_router.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/widgets/custom_app_bar_widget.dart';
import 'package:homesta/core/widgets/custom_button_widget.dart';
import 'package:homesta/features/cart/presentation/cubit/add_item_to_cart_cubit/add_item_to_cart_cubit.dart';
import 'package:homesta/features/cart/presentation/cubit/add_item_to_cart_cubit/add_item_to_cart_state.dart';
import 'package:homesta/features/product/domain/entities/product_entitty.dart';
import 'package:homesta/features/home/presentation/widgets/count_container.dart';
import 'package:homesta/features/product/presentation/widgets/discription_tab.dart';
import 'package:homesta/features/product/presentation/widgets/product_image_galary_section.dart';
import 'package:homesta/features/product/presentation/widgets/product_title_with_rating.dart';
import 'package:homesta/features/product/presentation/widgets/review_tab.dart';
import 'package:homesta/features/product/presentation/widgets/select_color_section.dart';
import 'package:homesta/features/product/presentation/widgets/tap_bar_widget.dart';
import 'package:homesta/features/seller/product/domain/entitiy/product_image_entity.dart';

class ProductDetailsView extends StatefulWidget {
  const ProductDetailsView({
    super.key,
    required this.productEntity,
    required this.images,
  });
  final ProductEntity productEntity;
  final List<ProductImageEntity> images;

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  int selectedQuantity = 1;
  String selectedColor = '';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: CustomAppBarWidget(
          backgroundColor: ColorManager.soLightGreyColor,
          text: 'Product Details',
        ),
        backgroundColor: ColorManager.soLightGreyColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProductImageGallerySection(
                  mainImage:
                      widget.images.isNotEmpty
                          ? widget.images.first.imageUrl
                          : "assets/images/catrgories_image/bedroom.png",
                  thumbnails: widget.images,
                ),
                SizedBox(height: 24.h),
                ProductTitleWithRating(
                  title: widget.productEntity.name,
                  rating: widget.productEntity.rating.toString(),
                ),
                SizedBox(height: 16.h),
                SelectColorSection(
                  colorStrings:
                      (widget.productEntity.colors as List<dynamic>?)
                          ?.map((e) => e.toString())
                          .toList() ??
                      [],
                  selectedColor: selectedColor,
                  onColorSelected: (color) {
                    setState(() {
                      selectedColor = color;
                    });
                  },
                ),
                SizedBox(height: 16.h),
                CountContainer(
                  onQuantityChanged: (value) {
                    setState(() {
                      selectedQuantity = value;
                    });
                  },
                  padding: EdgeInsets.symmetric(
                    vertical: 7.4.h,
                    horizontal: 11.5.w,
                  ),
                ),
                SizedBox(height: 16.h),
                BlocListener<AddItemToCartCubit, AddItemToCartState>(
                  listener: (context, state) {
                    if (state is AddItemToCartSuccess) {
                      GoRouter.of(context).push(AppRouter.cartScreen);
                    } else if (state is AddItemToCartFailure) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Failed to add to cart: ${state.error}',
                          ),
                        ),
                      );
                    }
                  },
                  child: CustomButtonWidget(
                    buttonText: 'Add to Cart',
                    onPressed: () {
                      if (selectedColor.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Please select a color'),
                          ),
                        );
                        return;
                      }

                      final cubit = context.read<AddItemToCartCubit>();
                      cubit.addItemToCart(
                        productId: widget.productEntity.productId,
                        quantity: selectedQuantity,
                        colorId: selectedColor,
                      );
                    },
                  ),
                ),

                SizedBox(height: 8.h),
                TapBarWidget(),

                SizedBox(
                  height: 500.h,
                  child: TabBarView(
                    children: [
                      DiscriptionTab(
                        description: widget.productEntity.description,
                      ),

                      ReviewTab(productEntity: widget.productEntity),
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
