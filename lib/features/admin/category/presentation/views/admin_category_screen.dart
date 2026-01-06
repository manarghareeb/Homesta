import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/theming/styles.dart';
import 'package:homesta/core/widgets/custom_app_bar_widget.dart';
import 'package:homesta/features/admin/category/presentation/widgets/add_category_section.dart';

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
            const AddCategorySection(),
            SizedBox(height: 24),
            Expanded(
              child: GridView.builder(
                //shrinkWrap: true,
                //physics: NeverScrollableScrollPhysics(),
                itemCount: 6,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 24.h,
                  crossAxisSpacing: 24.w,
                  childAspectRatio: 1.08.h,
                ),
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(),
                    child: Column(
                      children: [
                        AspectRatio(
                          aspectRatio: 1.2,
                          child: ClipRRect(
                            borderRadius: BorderRadiusGeometry.circular(10),
                            child: Image.asset(
                              'assets/images/image 1.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(height: 4),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Sofa',
                              style: TextStyles.font14deepGreyColorW400,
                            ),
                            Icon(
                              Icons.delete_outline_outlined,
                              color: ColorManager.redColor,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'ID: 1',
                              style: TextStyles.font14deepGreyColorW400,
                            ),
                            Icon(
                              Icons.edit_outlined,
                              color: ColorManager.primaryColor,
                            ),
                          ],
                        ),
                      ],
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
