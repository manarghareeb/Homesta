import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/theming/styles.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../categories/presentation/cubits/category_cubit/category_cubit.dart';

class ItemCategoryCard extends StatelessWidget {
  const ItemCategoryCard({
    super.key,
    required this.image,
    required this.name,
    required this.id,
    required this.cubit,
  });

  final String image;
  final String name;
  final String id;
  final CategoryCubit cubit;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(   // ✅ السكرول مضاف هون
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: ColorManager.soLightGreyColor,
        ),
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 1.0,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(image, fit: BoxFit.cover),
              ),
            ),
            const SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      name,
                      style: TextStyles.font14deepGreyColorW400,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.delete_outline_outlined, color: ColorManager.redColor),
                    onPressed: () {
                      context.read<CategoryCubit>().deleteCategory(int.parse(id));
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(id, style: TextStyles.font14deepGreyColorW400),
                  IconButton(
                    icon: Icon(Icons.edit_outlined, color: ColorManager.primaryColor),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          final TextEditingController nameController =
                          TextEditingController(text: name);
                          File? newImage;

                          return AlertDialog(
                            title: const Text("Edit Category"),
                            content: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  TextField(
                                    controller: nameController,
                                    decoration: const InputDecoration(hintText: "Enter new name"),
                                  ),
                                  ElevatedButton(
                                    onPressed: () async {
                                      final picked = await ImagePicker().pickImage(
                                        source: ImageSource.gallery,
                                      );
                                      if (picked != null) {
                                        newImage = File(picked.path);
                                      }
                                    },
                                    child: const Text("Select new image"),
                                  ),
                                ],
                              ),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  if (nameController.text.isNotEmpty && newImage != null) {
                                    cubit.updateCategory(
                                      int.parse(id),
                                      nameController.text,
                                      newImage!.path,
                                    );
                                    cubit.getCategories();
                                    Navigator.pop(context);
                                  }
                                },
                                child: const Text("Save"),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
