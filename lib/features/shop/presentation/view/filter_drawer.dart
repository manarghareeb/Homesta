import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/theming/styles.dart';
import 'package:homesta/features/categories/domain/entities/sub_category_entity.dart';
import 'package:homesta/features/categories/presentation/cubits/category_cubit/category_cubit.dart';
import 'package:homesta/features/categories/presentation/cubits/category_cubit/category_state.dart';
import 'package:homesta/features/categories/presentation/cubits/sub_category_cubit.dart/sub_category_cubit.dart';
import 'package:homesta/features/product/presentation/cubits/product_cubit.dart';
import 'package:homesta/features/shop/presentation/widgets/filter_apply_button.dart';
import 'package:homesta/features/shop/presentation/widgets/filter_checkbox_item.dart';
import 'package:homesta/features/shop/presentation/widgets/filter_color_item.dart';
import 'package:homesta/features/shop/presentation/widgets/filter_price_slider.dart';
import 'package:homesta/features/shop/presentation/widgets/filter_section.dart';

class FilterDrawer extends StatefulWidget {
  const FilterDrawer({
    super.key,
    required this.selectedCategoryIds,
    required this.onCategoryChanged,
    required this.selectedCategoryNames,
  });
  final Set<int> selectedCategoryIds;
  final Function(Set<int>, List<String>) onCategoryChanged;
  final List<String> selectedCategoryNames;

  @override
  State<FilterDrawer> createState() => _FilterDrawerState();
}

class _FilterDrawerState extends State<FilterDrawer> {
  late Set<int> localSelected;
  final Set<String> selectedColors = {};
  late List<String> selectedCategoryNames;
  bool inStockSelected = false;
  bool outOfStockSelected = false;
  double? startPrice;
  double? endPrice;

  final Map<String, Color> colors = const {
    'brown': Colors.brown,
    'grey': Colors.grey,
    'green': Colors.green,
    'red': Colors.red,
    'orange': Colors.orange,
    'blue': Colors.blue,
    'black': Colors.black,
  };

  @override
  void initState() {
    super.initState();
    localSelected = {...widget.selectedCategoryIds};
    selectedCategoryNames = [...widget.selectedCategoryNames];
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {});
    });
  }

  @override
  void didUpdateWidget(covariant FilterDrawer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.selectedCategoryIds != widget.selectedCategoryIds ||
        oldWidget.selectedCategoryNames != widget.selectedCategoryNames) {
      setState(() {
        localSelected = {...widget.selectedCategoryIds};
        selectedCategoryNames = [...widget.selectedCategoryNames];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      width: MediaQuery.of(context).size.width * 0.85,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const Spacer(),
                  Text('Filter Options', style: TextStyles.font16BlackRegular),
                ],
              ),
              Container(
                height: 1,
                width: double.infinity,
                color: ColorManager.greyColor,
              ),
              const SizedBox(height: 16),

              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      /// CATEGORY
                      BlocBuilder<CategoryCubit, CategoryState>(
                        builder: (context, state) {
                          if (state is CategoryLoading) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }

                          if (state is CategoryFailure) {
                            return Center(child: Text(state.message));
                          }

                          if (state is CategorySuccess) {
                            return FilterSection(
                              title: 'Category',
                              child: Column(
                                children:
                                    state.categories.map((category) {
                                      final isChecked = localSelected.contains(
                                        category.categoryId,
                                      );

                                      return ExpansionTile(
                                        title: FilterCheckboxItem(
                                          title: category.name,
                                          isChecked: isChecked,
                                          onTap: () {
                                            setState(() {
                                              if (isChecked) {
                                                localSelected.remove(
                                                  category.categoryId,
                                                );
                                                selectedCategoryNames.remove(
                                                  category.name,
                                                );
                                              } else {
                                                localSelected.add(
                                                  category.categoryId,
                                                );
                                                selectedCategoryNames.add(
                                                  category.name,
                                                );
                                              }
                                            });

                                            widget.onCategoryChanged(
                                              {...localSelected},
                                              [...selectedCategoryNames],
                                            );
                                          },
                                        ),

                                        children: [
                                          FutureBuilder<
                                            List<SubCategoryEntity>
                                          >(
                                            future: context
                                                .read<SubCategoryCubit>()
                                                .fetchSubCategories(
                                                  category.categoryId,
                                                ),
                                            builder: (context, snapshot) {
                                              if (snapshot.connectionState ==
                                                  ConnectionState.waiting) {
                                                return const Padding(
                                                  padding: EdgeInsets.all(8.0),
                                                  child:
                                                      CircularProgressIndicator(),
                                                );
                                              }

                                              if (snapshot.hasError) {
                                                return Padding(
                                                  padding: const EdgeInsets.all(
                                                    8.0,
                                                  ),
                                                  child: Text(
                                                    'Error loading subcategories',
                                                  ),
                                                );
                                              }

                                              final subCategories =
                                                  snapshot.data ?? [];

                                              if (subCategories.isEmpty) {
                                                return const Padding(
                                                  padding: EdgeInsets.all(8.0),
                                                  child: Text(
                                                    'No subcategories available',
                                                  ),
                                                );
                                              }

                                              return Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children:
                                                    subCategories.map((sub) {
                                                      final isSubChecked =
                                                          localSelected.contains(
                                                            sub.subCategoryId,
                                                          );

                                                      return Padding(
                                                        padding:
                                                            const EdgeInsets.only(
                                                              left: 24.0,
                                                              bottom: 4.0,
                                                            ),
                                                        child: FilterCheckboxItem(
                                                          title: sub.name,
                                                          isChecked:
                                                              isSubChecked,
                                                          onTap: () {
                                                            setState(() {
                                                              if (isSubChecked) {
                                                                localSelected
                                                                    .remove(
                                                                      sub.subCategoryId,
                                                                    );
                                                                selectedCategoryNames
                                                                    .remove(
                                                                      sub.name,
                                                                    );
                                                              } else {
                                                                localSelected.add(
                                                                  sub.subCategoryId,
                                                                );
                                                                selectedCategoryNames
                                                                    .add(
                                                                      sub.name,
                                                                    );
                                                              }
                                                            });

                                                            widget.onCategoryChanged(
                                                              {
                                                                ...localSelected,
                                                              },
                                                              [
                                                                ...selectedCategoryNames,
                                                              ],
                                                            );
                                                          },
                                                        ),
                                                      );
                                                    }).toList(),
                                              );
                                            },
                                          ),
                                        ],
                                      );
                                    }).toList(),
                              ),
                            );
                          }

                          return const SizedBox();
                        },
                      ),

                      /// PRICE
                      FilterSection(
                        title: 'Price Range',
                        child: FilterPriceSlider(
                          onPriceChanged: (start, end) {
                            startPrice = start;
                            endPrice = end;
                          },
                        ),
                      ),

                      /// COLORS
                      FilterSection(
                        title: 'Color',
                        child: Wrap(
                          spacing: 10,
                          runSpacing: 10,
                          children:
                              colors.entries.map((entry) {
                                final colorName = entry.key;
                                final colorValue = entry.value;

                                return FilterColorItem(
                                  color: colorValue,
                                  isSelected: selectedColors.contains(
                                    colorName,
                                  ),
                                  onTap: () {
                                    setState(() {
                                      selectedColors.contains(colorName)
                                          ? selectedColors.remove(colorName)
                                          : selectedColors.add(colorName);
                                    });
                                  },
                                );
                              }).toList(),
                        ),
                      ),

                      /// AVAILABILITY
                      FilterSection(
                        title: 'Availability',
                        child: Column(
                          children: [
                            FilterCheckboxItem(
                              title: 'In Stock',
                              isChecked: inStockSelected,
                              onTap: () {
                                setState(
                                  () => inStockSelected = !inStockSelected,
                                );
                              },
                            ),
                            FilterCheckboxItem(
                              title: 'Out of Stock',
                              isChecked: outOfStockSelected,
                              onTap: () {
                                setState(
                                  () =>
                                      outOfStockSelected = !outOfStockSelected,
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              /// APPLY BUTTON
              FilterApplyButton(
                onPressed: () {
                  widget.onCategoryChanged(
                    {...localSelected},
                    [...selectedCategoryNames],
                  );
                  context.read<ProductCubit>().applyFilters(
                    categoryIds: localSelected.toList(),
                    startPrice: startPrice,
                    endPrice: endPrice,
                    inStock: inStockSelected,
                    outOfStock: outOfStockSelected,
                  );
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
