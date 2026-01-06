import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:homesta/core/routing/app_router.dart';

import 'package:homesta/core/theming/styles.dart';
import 'package:homesta/core/widgets/custom_cached_network_image.dart';
import 'package:homesta/features/categories/domain/entities/category_entity.dart';

class CategoryItem extends StatelessWidget {
  final CategoryEntity categoryEntity;
  const CategoryItem({super.key, required this.categoryEntity});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(
          AppRouter.subcategoryScreen,
          extra: categoryEntity.categoryId,
        );
      },

      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        margin: EdgeInsets.only(bottom: 16.h),
        height: 142.h,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.r)),
        child: Stack(
          fit: StackFit.expand,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15.r),
              child: CustomCachedNetworkImage(
                imagePath: categoryEntity.imagePath,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.r),
                color: Colors.black.withOpacity(0.4),
              ),
            ),
            Center(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                decoration: BoxDecoration(),
                child: Text(
                  categoryEntity.name,
                  style: TextStyles.font16WhiteW500,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
