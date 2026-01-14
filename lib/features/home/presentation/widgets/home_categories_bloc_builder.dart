import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homesta/features/categories/domain/entities/category_entity.dart';
import 'package:homesta/features/categories/presentation/cubits/category_cubit/category_cubit.dart';
import 'package:homesta/features/categories/presentation/cubits/category_cubit/category_state.dart';
import 'package:homesta/features/home/presentation/widgets/home_category_skeletonizer.dart';
import 'package:homesta/features/home/presentation/widgets/home_categry_item.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeCategoriesBlocBuilder extends StatelessWidget {
  const HomeCategoriesBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
        if (state is CategoryLoading) {
          return HomeCategorySkeletonizer();
        } else if (state is CategoryFailure) {
          return Center(child: Text(state.message));
        } else if (state is CategorySuccess) {
          if (state.categories.isEmpty) {
            return const Center(child: Text("No categories found!"));
          } else {
            return SizedBox(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: state.categories.length,
                itemBuilder: (context, index) {
                  final category = state.categories[index];
                  return HomeCategryItem(categoryEntity: category);
                },
              ),
            );
          }
        } else {
          return Container(child: Text("opps something went wrong!"));
        }
      },
    );
  }
}
