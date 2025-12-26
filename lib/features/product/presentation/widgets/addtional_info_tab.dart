import 'package:flutter/material.dart';
import 'package:homesta/features/product/presentation/widgets/explore_product.dart';
import 'package:homesta/features/product/presentation/widgets/product_specification_table.dart';

class AddtionalInfoTab extends StatelessWidget {
  const AddtionalInfoTab({super.key});

  @override
  Widget build(BuildContext context) {
    return // لون خلفية الصفحة
    SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 15),
          const ProductSpecificationTable(),
          SizedBox(height: 10),
          ExploreProduct(),
        ],
      ),
    );
  }
}
