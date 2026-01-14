import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/theming/styles.dart';
import 'package:homesta/core/widgets/custom_app_bar_widget.dart';
import 'package:homesta/features/categories/presentation/cubits/category_cubit/category_cubit.dart';
import 'package:homesta/features/categories/presentation/cubits/category_cubit/category_state.dart';
import 'package:homesta/features/home/presentation/widgets/product_bloc_builder.dart';
import 'package:homesta/features/product/presentation/cubits/product_cubit.dart';
import 'package:homesta/features/product/presentation/cubits/product_state.dart';
import 'package:homesta/features/shop/presentation/view/filter_drawer.dart';
import 'package:homesta/features/shop/presentation/widgets/ActiveFiltersWidget.dart';
import 'package:homesta/features/shop/presentation/widgets/SortRowWidget.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  Set<int> selectedCategoryIds = {};
  List<String> activeFilters = [];

  void removeSingleFilter(BuildContext context, String filter) {
    final cubit = context.read<CategoryCubit>();

    setState(() {
      activeFilters.remove(filter);
      if (cubit.state is CategorySuccess) {
        final categories = (cubit.state as CategorySuccess).categories.where(
          (c) => c.name == filter,
        );
        if (categories.isNotEmpty) {
          selectedCategoryIds.remove(categories.first.categoryId);
        }
      }
    });
    context.read<ProductCubit>().filterProductsByCategories(
      selectedCategoryIds.toList(),
    );
  }

  void clearAllFilters(BuildContext context) {
    setState(() {
      activeFilters.clear();
      selectedCategoryIds.clear();
    });
    context.read<ProductCubit>().getAllProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: CustomAppBarWidget(text: 'Filters'),
          endDrawer: FilterDrawer(
            selectedCategoryNames: activeFilters,
            selectedCategoryIds: selectedCategoryIds,
            onCategoryChanged: (newSet, categoryNames) {
              setState(() {
                selectedCategoryIds = {...newSet};
                activeFilters = [...categoryNames];
              });
              context.read<ProductCubit>().filterProductsByCategories(
                selectedCategoryIds.toList(),
              );
            },
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SortRowWidget(),
                  const SizedBox(height: 16),
                  Divider(color: ColorManager.lightGreyColor),
                  const SizedBox(height: 16),
                  if (activeFilters.isNotEmpty)
                    ActiveFiltersWidget(
                      initialFilters: [...activeFilters],
                      onClearAll: () => clearAllFilters(context),
                      onRemoveFilter:
                          (filter) => removeSingleFilter(context, filter),
                    ),
                  const SizedBox(height: 24),
                  BlocBuilder<ProductCubit, ProductState>(
                    builder: (context, state) {
                      if (state is ProductSuccess) {
                        final filteredCount = state.products.length;
                        final totalCount =
                            context.read<ProductCubit>().allProducts.length;
                        return Text(
                          'Showing $filteredCount of $totalCount results',
                          style: TextStyles.font15BlackW400,
                        );
                      }
                      return const SizedBox();
                    },
                  ),
                  const SizedBox(height: 16),
                  const ProductBlocBuilder(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
