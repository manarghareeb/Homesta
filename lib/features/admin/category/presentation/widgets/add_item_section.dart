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
import '../../../../categories/presentation/cubits/category_cubit/category_cubit.dart';

class AddCategorySection extends StatefulWidget {
  final String managementTitle;
  final String description;
  final String addButtonText;
  final String nameFieldTitle;
  final String nameFieldHint;
  final String imageFieldTitle;

  const AddCategorySection({
    super.key,
    required this.managementTitle,
    required this.description,
    required this.addButtonText,
    required this.nameFieldTitle,
    required this.nameFieldHint,
    required this.imageFieldTitle,
  });

  @override
  State<AddCategorySection> createState() => _AddItemSectionState();
}

class _AddItemSectionState extends State<AddCategorySection> {
  bool isAdding = false;
  File? selectedImage;
  final TextEditingController nameController = TextEditingController();

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
        shrinkWrap: true, // ✅ يخليها تاخذ حجمها فقط داخل الصفحة
        physics: const NeverScrollableScrollPhysics(), // ✅ ما تعمل سكرول داخلي
        children: [
          /// العنوان وزر الإضافة
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

          /// الفورم
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
                        context.read<CategoryCubit>().addCategory(
                          nameController.text,
                          selectedImage!.path,
                        );
                        setState(() {
                          isAdding = false;
                          selectedImage = null;
                          nameController.clear();
                        });
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Please enter name and select image"),
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
