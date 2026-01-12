import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/core/di/service_locator.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/widgets/custom_app_bar_widget.dart';
import 'package:homesta/features/categories/presentation/widgets/product_item_card.dart';
import 'package:homesta/features/product/presentation/cubits/products_by_category_cubit/products_by_category_cubit.dart';
import 'package:homesta/features/product/presentation/cubits/products_by_category_cubit/products_by_category_state.dart';

class CategorySectionScreen extends StatelessWidget {
  const CategorySectionScreen({
    super.key,
    required this.categoryId,
    required this.subCategoryId,

    //required this.title,
    //required this.subCategory,
  });

  final int categoryId;
  final int subCategoryId;

  //final List<bool> favorites = List.generate(10, (_) => false);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.soLightGreyColor,
      appBar: CustomAppBarWidget(
        backgroundColor: ColorManager.soLightGreyColor,
        text: 'Products',
      ),
      body: BlocProvider(
        create:
            (context) =>
                sl<ProductsByCategoryCubit>()..loadProducts(
                  categoryId: categoryId,
                  subCategoryId: subCategoryId,
                ),
        child: BlocBuilder<ProductsByCategoryCubit, ProductsByCategoryState>(
          builder: (context, state) {
            if (state is ProductsByCategoryLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ProductsByCategoryFailure) {
              return Center(child: Text(state.message));
            } else if (state is ProductsByCategorySuccess) {
              final products = state.products;
              if (products.isEmpty) {
                return const Center(child: Text("No products found!"));
              }
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
                child: GridView.builder(
                  itemCount: products.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 24.h,
                    crossAxisSpacing: 24.w,
                    //childAspectRatio: 1.3.h,
                  ),
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return GestureDetector(
                      onTap: () {
                        //GoRouter.of(context).push(AppRouter.productDetailsScreen);
                      },
                      child: ProductItemCard(
                        image: 'assets/images/image 1.png',
                        name: product.name,
                        price: product.price,
                      ),
                    );
                  },
                ),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
