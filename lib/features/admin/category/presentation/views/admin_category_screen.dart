import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:homesta/core/routing/app_router.dart';
import 'package:homesta/core/widgets/custom_app_bar_widget.dart';
import 'package:homesta/features/admin/category/presentation/widgets/add_item_section.dart';
import 'package:homesta/features/admin/category/presentation/widgets/item_category_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../categories/presentation/cubits/category_cubit/category_cubit.dart';
import '../../../../categories/presentation/cubits/category_cubit/category_state.dart';

class AdminCategoryScreen extends StatelessWidget {
  const AdminCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBarWidget(text: 'Category'),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
        child: Column(
          children: [
            /// قسم الإضافة
            Expanded(
              child: ListView(
                children: [
                  AddCategorySection(
                    managementTitle: 'Management Category',
                    description: 'Kelola kategori furniture Anda',
                    addButtonText: 'Add category',
                    nameFieldTitle: 'Name Category',
                    nameFieldHint: 'Enter Name Category',
                    imageFieldTitle: 'Image Category',
                  ),
                  SizedBox(height: 24),

                  /// عرض الكاتيجوريز
                  BlocBuilder<CategoryCubit, CategoryState>(
                    builder: (context, state) {
                      if (state is CategoryLoading) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (state is CategorySuccess) {
                        return GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: state.categories.length,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 10.h,
                            crossAxisSpacing: 20.w,
                            childAspectRatio: 0.6.h,
                          ),
                          itemBuilder: (context, index) {
                            final category = state.categories[index];
                            return GestureDetector(
                              onTap: () {
                                GoRouter.of(context).push(
                                  AppRouter.adminSubCategoryScreen,
                                  extra: category.categoryId,
                                );
                              },
                              child: ItemCategoryCard(
                                image: "http://homefinish.runasp.net/${category.imagePath}",
                                name: category.name,
                                id: category.categoryId.toString(),
                                cubit: context.read<CategoryCubit>(),
                              ),
                            );
                          },
                        );
                      } else if (state is CategoryFailure) {
                        return Center(child: Text(state.message));
                      } else {
                        return const SizedBox.shrink();
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
