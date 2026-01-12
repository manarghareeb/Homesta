import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/theming/styles.dart';
import 'package:homesta/features/categories/domain/entities/category_entity.dart';
import 'package:homesta/features/categories/presentation/cubits/category_cubit/category_cubit.dart';
import 'package:homesta/features/categories/presentation/cubits/category_cubit/category_state.dart';


class SelectCategory extends StatefulWidget {
  const SelectCategory({
    super.key,
    required this.onCategorySelected,
    this.initialCategoryId,
  });

  final Function(int categoryId) onCategorySelected;
  final int? initialCategoryId;

  @override
  State<SelectCategory> createState() => _SelectCategoryState();
}

class _SelectCategoryState extends State<SelectCategory> {
  CategoryEntity? selectedCategory;

  @override
  void initState() {
    super.initState();
    context.read<CategoryCubit>().getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
        if (state is CategoryLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is CategorySuccess) {
          // في حالة Edit
          if (widget.initialCategoryId != null && selectedCategory == null) {
            selectedCategory = state.categories.firstWhere(
              (c) => c.categoryId == widget.initialCategoryId,
            );
          }

          return _buildDropdown(state.categories);
        }

        if (state is CategoryFailure) {
          return Text(state.message);
        }

        return const SizedBox();
      },
    );
  }

  Widget _buildDropdown(List<CategoryEntity> categories) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: ColorManager.lightGreyIconColor),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<CategoryEntity>(
          dropdownColor: Colors.white,
          borderRadius: BorderRadius.circular(15),
          value: selectedCategory,
          hint: Text(
            'Select the category of the added item',
            style: TextStyles.font16BlackW500,
          ),
          isExpanded: true,
          icon: const Icon(Icons.keyboard_arrow_down_rounded),
          items: categories
              .map(
                (cat) => DropdownMenuItem(
                  value: cat,
                  child: Text(cat.name),
                ),
              )
              .toList(),
          onChanged: (value) {
            setState(() {
              selectedCategory = value;
            });
            widget.onCategorySelected(value!.categoryId);
          },
        ),
      ),
    );
  }
}
