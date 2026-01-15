import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/widgets/custom_cached_network_image.dart';
import 'package:homesta/features/categories/domain/entities/category_entity.dart';

class HomeCategryItem extends StatelessWidget {
  const HomeCategryItem({super.key, required this.categoryEntity});
final CategoryEntity categoryEntity;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
      //width: 140,
      height: 200,
        decoration: BoxDecoration(
          color:  ColorManager.thirdColor,
          borderRadius: BorderRadius.circular(18.r),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 6),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
          child: Row(
                 mainAxisSize: MainAxisSize.min,
            children: [
            CustomCachedNetworkImage(imagePath: categoryEntity.imagePath,width: 18,height: 18,),
              SizedBox(width: 6.w),
              FittedBox(
                child: Text(
                  categoryEntity.name,
                  style: TextStyle(
                    color:  Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}