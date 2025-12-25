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
         spacing: 20,
           children: [
            SizedBox(height: 5,),
             const ProductSpecificationTable(),
             ExploreProduct()
           ],
         ),
       );
  }
}
