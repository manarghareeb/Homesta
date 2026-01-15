import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/theming/styles.dart';
import 'package:homesta/core/widgets/custom_text_field_widget.dart';
import 'package:homesta/core/widgets/title_to_text_field.dart';
import 'package:homesta/features/admin/category/presentation/widgets/save_and_discard_buttons.dart';
import '../../../../categories/presentation/cubits/sub_category_cubit.dart/sub_category_cubit.dart';

class AddSubItemSection extends StatefulWidget {
  final String managementTitle;
  final String description;
  final String addButtonText;
  final String nameFieldTitle;
  final String nameFieldHint;
  final String imageFieldTitle;
  final int categoryId;

  const AddSubItemSection({
    super.key,
    required this.managementTitle,
    required this.description,
    required this.addButtonText,
    required this.nameFieldTitle,
    required this.nameFieldHint,
    required this.imageFieldTitle,
    required this.categoryId,
  });

  @override
  State<AddSubItemSection> createState() => _AddSubItemSectionState();
}

class _AddSubItemSectionState extends State<AddSubItemSection> {
  bool isAdding = false;
  File? selectedImage;
  final TextEditingController nameController = TextEditingController();
  double price = 0.0;

  Future<void> _pickImage() async {
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() {
        selectedImage = File(picked.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom, // ✅ يرفع المحتوى فوق الكيبورد
      ),
      child: ListView(
        shrinkWrap: true, // ✅ يخليها تاخذ حجمها فقط
        physics: const NeverScrollableScrollPhysics(), // ✅ يمنع سكرول داخلي
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
                  padding: EdgeInsets.all(4.w),
                  decoration: BoxDecoration(
                    color: ColorManager.primaryColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.add, color: Colors.white),
                      SizedBox(width: 4),
                      Text(widget.addButtonText,
                          style: TextStyles.font14WhiteColorW400),
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
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: _pickImage,
                        child: const Text("Select Image"),
                      ),
                      SizedBox(width: 12),
                      if (selectedImage != null)
                        Text("Image selected",
                            style: TextStyles.font14GreyColorW400),
                    ],
                  ),

                  SizedBox(height: 20.h),

                  SaveAndDiscardButtons(
                    saveOnPressed: () {
                      if (nameController.text.isNotEmpty &&
                          selectedImage != null) {
                        context.read<SubCategoryCubit>().addSubCategory(
                          widget.categoryId,
                          nameController.text,
                          selectedImage!.path,
                          price,
                        );
                        setState(() {
                          isAdding = false;
                          selectedImage = null;
                          nameController.clear();
                        });
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Please enter name, price and select image"),
                          ),
                        );
                      }
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
      ),
    );
  }
}
