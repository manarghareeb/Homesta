import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/theming/styles.dart';
import 'package:homesta/features/categories/domain/entities/sub_category_entity.dart';
import 'package:homesta/features/categories/presentation/cubits/sub_category_cubit.dart/sub_category_cubit.dart';
import 'package:homesta/features/categories/presentation/cubits/sub_category_cubit.dart/sub_category_state.dart';
class SelectSubCategory extends StatefulWidget {
  const SelectSubCategory({
    super.key,
    required this.categoryId,
    required this.onSubCategorySelected,
    this.initialSubCategoryId,
  });

  final int categoryId;
  final Function(int subCategoryId) onSubCategorySelected;
  final int? initialSubCategoryId;

  @override
  State<SelectSubCategory> createState() => _SelectSubCategoryState();
}

class _SelectSubCategoryState extends State<SelectSubCategory> {
  SubCategoryEntity? selectedSubCategory;

  @override
  void didUpdateWidget(covariant SelectSubCategory oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.categoryId != widget.categoryId) {
      selectedSubCategory = null; // reset
      context.read<SubCategoryCubit>().getSubCategories(widget.categoryId);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SubCategoryCubit, SubCategoryState>(
      builder: (context, state) {
        if (state is SubCategoryLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is SubCategoryFailure) {
          return Text(state.message);
        }

final List<SubCategoryEntity> subCategories =
    state is SubCategorySuccess ? List<SubCategoryEntity>.from(state.categories) : [];

        return Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(color: ColorManager.lightGreyIconColor),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<SubCategoryEntity>(
              dropdownColor: Colors.white,
              borderRadius: BorderRadius.circular(15),
              value: selectedSubCategory,
              hint: Text(
                'Select SubCategory',
                style: TextStyles.font16BlackW500,
              ),
              isExpanded: true,
              icon: const Icon(Icons.keyboard_arrow_down_rounded),
              items: subCategories
                  .map(
                    (sub) => DropdownMenuItem(
                      value: sub,
                      child: Text(sub.name),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedSubCategory = value;
                });
                widget.onSubCategorySelected(value!.subCategoryId);
              },
            ),
          ),
        );
      },
    );
  }
}
