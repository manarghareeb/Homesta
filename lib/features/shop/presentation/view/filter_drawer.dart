import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/theming/styles.dart';
import 'package:homesta/features/categories/presentation/cubits/category_cubit/category_cubit.dart';
import 'package:homesta/features/categories/presentation/cubits/category_cubit/category_state.dart';
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
                            return const CircularProgressIndicator();
                          }
                          if (state is CategoryFailure) {
                            return Center(child: Text(state.message));
                          }
                          if (state is CategorySuccess) {
                            return FilterSection(
                              title: 'Category',
                              child: ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: state.categories.length,
                                itemBuilder: (context, index) {
                                  final category = state.categories[index];
                                  final isChecked = localSelected.contains(
                                    category.categoryId,
                                  );

                                  return FilterCheckboxItem(
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
                                      //widget.onCategoryChanged(localSelected, selectedCategoryNames);
                                    },
                                  );
                                },
                              ),
                            );
                          }
                          return const SizedBox();
                        },
                      ),

                      /// PRICE
                      const FilterSection(
                        title: 'Price Range',
                        child: FilterPriceSlider(),
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
                          /*colors.entries.map((entry) {
                                return BlocBuilder<
                                  ProductFilterCubit,
                                  ProductFilter
                                >(
                                  builder: (context, filterState) {
                                    final isSelected = filterState.colors
                                        .contains(entry.key);
                                    return FilterColorItem(
                                      color: entry.value,
                                      isSelected: isSelected,
                                      onTap: () {
                                        context
                                            .read<ProductFilterCubit>()
                                            .toggleColor(entry.key);
                                      },
                                    );
                                  },
                                );
                              }).toList(),*/
                        ),
                      ),

                      /// AVAILABILITY
                      FilterSection(
                        title: 'Availability',
                        child: Column(
                          children: [
                            FilterCheckboxItem(
                              title: 'In Stock',
                              isChecked: true,
                              onTap: () {},
                            ),
                            FilterCheckboxItem(
                              title: 'Out of Stock',
                              isChecked: true,
                              onTap: () {},
                            ),
                            /*BlocBuilder<ProductFilterCubit, ProductFilter>(
                              builder: (context, filterState) {
                                return FilterCheckboxItem(
                                  title: 'In Stock',
                                  isChecked: filterState.inStock == true,
                                  onTap: () {
                                    context
                                        .read<ProductFilterCubit>()
                                        .setAvailability(
                                          filterState.inStock == true
                                              ? null
                                              : true,
                                        );
                                  },
                                );
                              },
                            ),
                            BlocBuilder<ProductFilterCubit, ProductFilter>(
                              builder: (context, filterState) {
                                return FilterCheckboxItem(
                                  title: 'Out of Stock',
                                  isChecked: filterState.inStock == false,
                                  onTap: () {
                                    context
                                        .read<ProductFilterCubit>()
                                        .setAvailability(
                                          filterState.inStock == false
                                              ? null
                                              : false,
                                        );
                                  },
                                );
                              },
                            ),*/
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
                  print('++++++++++++++++++++++++++++++++++');
                  print('selectedCategoryIds: $localSelected');
                  print('selectedCategoryNames: $selectedCategoryNames');

                  /*widget.onCategoryChanged(
                    localSelected,
                    selectedCategoryNames,
                  );*/
                  widget.onCategoryChanged(
                    {...localSelected},
                    [...selectedCategoryNames],
                  );
                  context.read<ProductCubit>().filterProductsByCategories(
                    localSelected.toList(),
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
