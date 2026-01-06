import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:homesta/features/categories/presentation/cubits/sub_category_cubit.dart/sub_category_cubit.dart';
import 'package:homesta/features/categories/presentation/cubits/sub_category_cubit.dart/sub_category_state.dart';
import 'package:homesta/features/categories/presentation/widgets/SubCategoryItem.dart';

class SubCategoryBlocBuilder extends StatelessWidget {
  const SubCategoryBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SubCategoryCubit, SubCategoryState>(
      builder: (context, state) {
        if (state is SubCategoryLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is SubCategoryFailure) {
          return Center(child: Text(state.message));
        } else if (state is SubCategorySuccess) {
          final subCategories = state.categories;
          if (subCategories.isEmpty) {
            return const Center(child: Text("No sub categories found!"));
          }

          return Expanded(
            child: ListView.separated(
              itemCount: subCategories.length,
              separatorBuilder: (_, __) => Divider(color: Colors.grey.shade300),
              itemBuilder: (context, index) {
                final item = subCategories[index];
                return SubCategoryItem(
                  title: item.name,
                  image: item.imagePath,
                  onTap: () {
                    // context.push(AppRouter.categorySectionScreen,extra: item.categoryId);
                    // GoRouter.of(context).push(
                    //   '/categorySection/'
                    //   '${Uri.encodeComponent(categoryName)}/'
                    //   '${Uri.encodeComponent(item['title']!)}',
                    // );
                  },
                );
              },
            ),
          );
        }
        return Container(child: Text("oppes something went wrong!"));
      },
    );
  }
}
