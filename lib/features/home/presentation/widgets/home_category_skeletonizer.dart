import 'package:flutter/material.dart';
import 'package:homesta/features/categories/domain/entities/category_entity.dart';
import 'package:homesta/features/home/presentation/widgets/home_categry_item.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeCategorySkeletonizer extends StatelessWidget {
  const HomeCategorySkeletonizer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Skeletonizer(
                enabled: true,
                child: HomeCategryItem(categoryEntity: CategoryEntity(categoryId: 0, name: "loading...", imagePath: "imagePath")));
           
                    },
                  ),
    );
  }
}