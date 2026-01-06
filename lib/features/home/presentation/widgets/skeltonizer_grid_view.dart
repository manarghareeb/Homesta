import 'package:flutter/material.dart';
import 'package:homesta/features/home/presentation/widgets/product_item.dart';
import 'package:homesta/features/product/domain/entities/product_entitty.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SkeletonizerGridView extends StatelessWidget {
  const SkeletonizerGridView({super.key});

  static final List<ProductEntity> _dummyProducts = List.generate(
    6,
    (index) => ProductEntity(
      productId: 1,
      name: "Loading",
      description: "Loading",
      colors: [],
      price: 0,
      rating: 0,
      quantity: 0,
      discount: 0,
      deliveryTime: 0,
      subCategoryId: 0,
      categoryId: 0,
      storeId: 0,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,

      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 220,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 0.75,
        ),
        itemCount: _dummyProducts.length,
        itemBuilder: (context, index) {
          return Skeletonizer(
            child: ProductItem(productEntity: _dummyProducts[index]),
          );
        },
      ),
    );
  }
}
