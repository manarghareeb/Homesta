import 'package:flutter/material.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/features/shop/presentation/widgets/filter_apply_button.dart';
import 'package:homesta/features/shop/presentation/widgets/filter_checkbox_item.dart';
import 'package:homesta/features/shop/presentation/widgets/filter_color_item.dart';
import 'package:homesta/features/shop/presentation/widgets/filter_price_slider.dart';
import 'package:homesta/features/shop/presentation/widgets/filter_section.dart';

class FilterDrawer extends StatefulWidget {
  const FilterDrawer({super.key});

  @override
  State<FilterDrawer> createState() => _FilterDrawerState();
}

class _FilterDrawerState extends State<FilterDrawer> {
  final Set<String> selectedColors = {};

  final Map<String, Color> colors = {
    'brown': Colors.brown,
    'grey': Colors.grey,
    'green': Colors.green,
    'red': Colors.red,
    'orange': Colors.orange,
    'blue': Colors.blue,
    'black': Colors.black,
  };

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
              /// Header
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const Spacer(),
                  const Text(
                    'Filter Options',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Container(
                height: 1,
                width: double.infinity,
                color: ColorManager.greyColor,
              ),

              const SizedBox(height: 12),

              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      /// CATEGORY
                      FilterSection(
                        title: 'Category',
                        child: Column(
                          children: const [
                            FilterCheckboxItem(title: 'Bed room'),
                            FilterCheckboxItem(title: 'Bathroom'),
                            FilterCheckboxItem(title: 'Living room'),
                            FilterCheckboxItem(title: 'Decoration'),
                            FilterCheckboxItem(title: 'Kitchen'),
                            FilterCheckboxItem(title: 'Electronic'),
                            FilterCheckboxItem(title: 'Medical devices'),
                          ],
                        ),
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
                        ),
                      ),

                      /// MATERIAL
                      FilterSection(
                        title: 'Material',
                        child: Column(
                          children: const [
                            FilterCheckboxItem(title: 'Metal'),
                            FilterCheckboxItem(title: 'Wood'),
                            FilterCheckboxItem(title: 'Upholstered'),
                            FilterCheckboxItem(title: 'Glass'),
                            FilterCheckboxItem(title: 'Plastic'),
                          ],
                        ),
                      ),

                      /// AVAILABILITY
                      FilterSection(
                        title: 'Availability',
                        child: Column(
                          children: const [
                            FilterCheckboxItem(title: 'In Stock'),
                            FilterCheckboxItem(title: 'Out of Stock'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              FilterApplyButton(onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
