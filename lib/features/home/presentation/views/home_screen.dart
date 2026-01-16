import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:homesta/core/di/service_locator.dart';
import 'package:homesta/core/routing/app_router.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/features/cart/presentation/cubit/add_item_to_cart_cubit/add_item_to_cart_cubit.dart';
import 'package:homesta/features/categories/presentation/cubits/category_cubit/category_cubit.dart';
import 'package:homesta/features/home/presentation/widgets/home_categories_bloc_builder.dart';
import 'package:homesta/features/home/presentation/widgets/product_bloc_builder.dart';
import 'package:homesta/features/product/presentation/cubits/product_cubit.dart';

import '../widgets/app_bar.dart';
import '../widgets/home_hero_banner.dart';
import '../widgets/sales_promotions_widget.dart';
import '../widgets/products_tabs_widget.dart';
import '../widgets/flash_sale_widget.dart';
import '../widgets/deals_of_the_day_widget.dart';
import '../widgets/discount_banner_widget.dart';
import '../widgets/trending_sales_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
       // BlocProvider(create: (context) => sl<ProductCubit>()..getAllProducts()),
        BlocProvider(create: (context) => sl<CategoryCubit>()..getCategories()),
      ],
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: const HomeAppBar(),
        body: LayoutBuilder(
          builder: (context, constraints) {
            final isTablet = constraints.maxWidth >= 600;
            final isDesktop = constraints.maxWidth >= 1000;

            return SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: isDesktop ? 48.w : 16.w,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 16.h),

                  const HomeHeroBanner(),
                  SizedBox(height: 20.h),
                  const Text(
                    'Categories',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),

                  HomeCategoriesBlocBuilder(),
                  SizedBox(height: 24.h),

                  const SalesPromotionsWidget(),
                  SizedBox(height: 24.h),

                  const ProductsTabsWidget(),
                  SizedBox(height: 16.h),

                  BlocProvider(
                    create: (context) => sl<AddItemToCartCubit>(),
                    child: const ProductBlocBuilder(),
                  ),
                  SizedBox(height: 24.h),

                  const FlashSaleWidget(),
                  SizedBox(height: 24.h),

                  const DealsOfDayWidget(),
                  SizedBox(height: 24.h),

                  const DiscountBannerWidget(),
                  SizedBox(height: 16.h),
                  const DiscountBannerWidget(dark: true),

                  SizedBox(height: 24.h),

                  const TrendingSalesSection(title: 'Trending'),
                  SizedBox(height: 24.h),
                  const TrendingSalesSection(title: 'Sales'),

                  SizedBox(height: 32.h),
                ],
              ),
            );
          },
        ),

        floatingActionButton: FloatingActionButton(
          backgroundColor: ColorManager.aliceBlue,
          mini: true,
          shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.circular(6.r),
          ),
          onPressed: () {
            context.push(AppRouter.chatScreen);
          },
          child: Icon(Icons.chat, color: ColorManager.blackColor),
        ),
      ),
    );
  }
}
