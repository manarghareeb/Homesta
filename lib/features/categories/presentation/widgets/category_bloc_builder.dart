import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homesta/features/categories/presentation/cubits/category_cubit/category_cubit.dart';
import 'package:homesta/features/categories/presentation/cubits/category_cubit/category_state.dart';
import 'package:homesta/features/categories/presentation/widgets/category_item.dart';

import 'package:homesta/features/categories/presentation/widgets/skeltonizer_list.dart';

class CategoryBlocBuilder extends StatelessWidget {
  const CategoryBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<CategoryCubit, CategoryState>(
        builder: (context, state) {
          if (state is CategoryLoading) {
            return const SkeltonizerList();
          } else if (state is CategoryFailure) {
            return Center(child: Text(state.message));
          } else if (state is CategorySuccess) {
            if (state.categories.isEmpty) {
              return const Center(child: Text("No categories found!"));
            } else {
              return ListView.builder(
                itemCount: state.categories.length,
                itemBuilder: (context, index) {
                  final category = state.categories[index];
                  return CategoryItem( categoryEntity:category);
                },
              );
            }
          } else {
            return Container(child: Text("opps something went wrong!"));
          }
        },
      ),
    );
  }
}
