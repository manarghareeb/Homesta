import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/theming/styles.dart';
import 'package:homesta/core/widgets/custom_text_field_widget.dart';
import 'package:homesta/core/widgets/title_to_text_field.dart';
import 'package:homesta/features/admin/category/presentation/widgets/save_and_discard_buttons.dart';
import 'package:homesta/features/admin/category/presentation/widgets/upload_image_widget.dart';

class AddItemSection extends StatefulWidget {
  final String managementTitle;
  final String description;
  final String addButtonText;
  final String nameFieldTitle;
  final String nameFieldHint;
  final String imageFieldTitle;

  const AddItemSection({
    super.key,
    required this.managementTitle,
    required this.description,
    required this.addButtonText,
    required this.nameFieldTitle,
    required this.nameFieldHint,
    required this.imageFieldTitle,
  });

  @override
  State<AddItemSection> createState() => _AddItemSectionState();
}

class _AddItemSectionState extends State<AddItemSection> {
  bool isAdding = false;
  File? selectedImage;
  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.managementTitle, style: TextStyles.font15BlackW500),
                SizedBox(height: 8),
                Text(widget.description, style: TextStyles.font12GreyColorW400),
              ],
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  isAdding = true;
                });
              },
              child: Container(
                padding: EdgeInsets.all(8.w),
                decoration: BoxDecoration(
                  color: ColorManager.primaryColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: [
                    Icon(Icons.add, color: Colors.white),
                    SizedBox(width: 4),
                    Text(
                      widget.addButtonText,
                      style: TextStyles.font14WhiteColorW400,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        if (isAdding)
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
                TitleToTextField(title: widget.nameFieldTitle),
                SizedBox(height: 8),
                CustomTextFieldWidget(
                  controller: nameController,
                  hintText: widget.nameFieldHint,
                  textInputType: TextInputType.name,
                  title: widget.nameFieldHint,
                ),
                SizedBox(height: 16.h),
                TitleToTextField(title: widget.imageFieldTitle),
                SizedBox(height: 8),
                const UploadImageWidget(),
                SizedBox(height: 20.h),
                SaveAndDiscardButtons(
                  saveOnPressed: () {
                    setState(() {
                      isAdding = false;
                      selectedImage = null;
                      nameController.clear();
                    });
                  },
                  discardOnPressed: () {
                    setState(() {
                      isAdding = false;
                      selectedImage = null;
                      nameController.clear();
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
