import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/core/widgets/custom_app_bar_widget.dart';
import '../../../../categories/presentation/cubits/sub_category_cubit.dart/sub_category_cubit.dart';
import '../../../../categories/presentation/cubits/sub_category_cubit.dart/sub_category_state.dart';
import '../widgets/add_sub_item_section.dart';
import '../widgets/item_sub_category_card.dart';

class AdminSubCategoryScreen extends StatelessWidget {
  final int categoryId;
  const AdminSubCategoryScreen({super.key, required this.categoryId});

  @override
  Widget build(BuildContext context) {
    context.read<SubCategoryCubit>().getSubCategories(categoryId);
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true, // ✅ يخلي الصفحة تتحرك مع الكيبورد
      appBar: CustomAppBarWidget(text: 'Sub Category'),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
        child: ListView( // ✅ استبدلنا Column بـ ListView للسكرول الكامل
          children: [
            AddSubItemSection(
              managementTitle: 'Management SubCategory',
              description: 'Kelola subcategory furniture Anda',
              addButtonText: 'Add subcategory',
              nameFieldTitle: 'Name SubCategory',
              nameFieldHint: 'Enter Name SubCategory',
              imageFieldTitle: 'Image SubCategory',
              categoryId: categoryId,
            ),
            SizedBox(height: 24),

            BlocBuilder<SubCategoryCubit, SubCategoryState>(
              builder: (context, state) {
                if (state is SubCategoryLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is SubCategorySuccess) {
                  return GridView.builder(
                    shrinkWrap: true, // ✅ يخلي الشبكة تاخذ حجمها فقط
                    physics: const NeverScrollableScrollPhysics(), // ✅ يمنع سكرول داخلي
                    itemCount: state.categories.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10.h,
                      crossAxisSpacing: 10.w,
                      childAspectRatio: 0.6.h,
                    ),
                    itemBuilder: (context, index) {
                      final sub = state.categories[index];
                      return GestureDetector(
                        onTap: () {
                          // ممكن تضيفي التنقل هنا
                        },
                        child: ItemSubCategoryCard(
                          image: "http://homefinish.runasp.net/${sub.imagePath}",
                          name: sub.name,
                          id: sub.subCategoryId.toString(),
                          price: '0',
                          categoryId: categoryId,
                          cubit: context.read<SubCategoryCubit>(),
                        ),
                      );
                    },
                  );
                } else if (state is SubCategoryFailure) {
                  return Center(child: Text(state.message));
                } else {
                  return const SizedBox.shrink();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
