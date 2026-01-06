import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:homesta/core/routing/app_router.dart';
import 'package:homesta/core/widgets/custom_app_bar_widget.dart';
import 'package:homesta/features/admin/category/presentation/widgets/add_item_section.dart';
import 'package:homesta/features/admin/category/presentation/widgets/item_card.dart';

class AdminSubCategoryScreen extends StatelessWidget {
  const AdminSubCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBarWidget(text: 'Sub Category'),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
        child: Column(
          children: [
            AddItemSection(
              managementTitle: 'Management SubCategory',
              description: 'Kelola subcategory furniture Anda',
              addButtonText: 'Add subcategory',
              nameFieldTitle: 'Name SubCategory',
              nameFieldHint: 'Enter Name SubCategory',
              imageFieldTitle: 'Image SubCategory',
            ),
            SizedBox(height: 24),
            Expanded(
              child: GridView.builder(
                itemCount: 6,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 24.h,
                  crossAxisSpacing: 24.w,
                  childAspectRatio: 1.04.h,
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      GoRouter.of(
                        context,
                      ).push(AppRouter.adminSubCategoryScreen);
                    },
                    child: ItemCard(
                      image: 'assets/images/image 1.png',
                      name: 'Sofa',
                      id: 'ID: 1',
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
