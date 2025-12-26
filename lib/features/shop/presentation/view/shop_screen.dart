import 'package:flutter/material.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/features/shop/presentation/view/filter_drawer.dart';
import 'package:homesta/features/shop/presentation/widgets/SortRowWidget.dart';
import 'package:homesta/features/shop/presentation/widgets/ActiveFiltersWidget.dart';
import 'package:homesta/features/shop/presentation/widgets/ProductsGrid.dart';

class FiltersScreen extends StatelessWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text('Filters', style: TextStyle(color: Colors.black)),
      ),

      endDrawer: const FilterDrawer(),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// 🔽 SORT + FILTER ICON
            const SortRowWidget(),

            const SizedBox(height: 16),

            ActiveFiltersWidget(
              initialFilters: const [
                'Price: \$25.00 - \$100.00',
                'Brown',
                'Instock',
              ],
              onClearAll: () {},
              onRemoveFilter: (filter) {},
            ),

            const SizedBox(height: 8),

            const Text(
              'Showing 1–12 of 240 results',
              style: TextStyle(color: ColorManager.blackColor),
            ),

            const SizedBox(height: 12),

            const Expanded(child: ProductsGridWidget()),
          ],
        ),
      ),
    );
  }
}
