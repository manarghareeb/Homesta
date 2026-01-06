import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/theming/styles.dart';
import 'package:homesta/core/widgets/custom_text_field_widget.dart';
import 'package:homesta/core/widgets/title_to_text_field.dart';
import 'package:homesta/features/admin/category/presentation/widgets/save_and_discard_buttons.dart';
import 'package:homesta/features/admin/category/presentation/widgets/upload_image_widget.dart';

class AddCategorySection extends StatefulWidget {
  const AddCategorySection({super.key});

  @override
  State<AddCategorySection> createState() => _AddCategorySectionState();
}

class _AddCategorySectionState extends State<AddCategorySection> {
  bool isAddingCategory = false;
  File? selectedImage;
  final TextEditingController categoryNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text('Management Category', style: TextStyles.font15BlackW500),
                SizedBox(height: 8),
                Text(
                  'Kelola kategori furniture Anda',
                  style: TextStyles.font12GreyColorW400,
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  isAddingCategory = true;
                });
              },
              child: Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: ColorManager.primaryColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: [
                    Icon(Icons.add, color: Colors.white),
                    SizedBox(width: 8),
                    Text(
                      'Add category',
                      style: TextStyles.font14WhiteColorW400,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        if (isAddingCategory)
          Container(
            padding: EdgeInsets.all(16.w),
            margin: EdgeInsets.symmetric(vertical: 24.h),
            decoration: BoxDecoration(
              color: ColorManager.soLightGreyColor,
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(color: ColorManager.soLightGreyColor),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TitleToTextField(title: 'Name Category'),
                SizedBox(height: 8),
                CustomTextFieldWidget(
                  controller: categoryNameController,
                  hintText: 'Enter Name Category',
                  textInputType: TextInputType.name,
                  title: 'Enter Name Category',
                ),
                SizedBox(height: 16.h),
                TitleToTextField(title: 'Image Category'),
                SizedBox(height: 8),
                const UploadImageWidget(),
                SizedBox(height: 20.h),
                SaveAndDiscardButtons(
                  saveOnPressed: () {
                    setState(() {
                      isAddingCategory = false;
                      selectedImage = null;
                      categoryNameController.clear();
                    });
                  },
                  discardOnPressed: () {
                    setState(() {
                      isAddingCategory = false;
                      selectedImage = null;
                      categoryNameController.clear();
                    });
                  },
                ),
              ],
            ),
          ),
      ],
    );
  }
}
