import 'package:flutter/material.dart';
import 'package:homesta/features/product/presentation/widgets/product_specification_table.dart';


class AddtionalInfoTab extends StatelessWidget {
  const AddtionalInfoTab({super.key});

  @override
  Widget build(BuildContext context) {
    return // لون خلفية الصفحة
       Padding(
         padding: const EdgeInsets.all(8.0),
         child: Column(
         spacing: 20,
           children: [
             const ProductSpecificationTable(),
           ],
         ),
       );
  }
}
