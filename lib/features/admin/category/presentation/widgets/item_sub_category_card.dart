import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/theming/styles.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../categories/presentation/cubits/sub_category_cubit.dart/sub_category_cubit.dart';

class ItemSubCategoryCard extends StatelessWidget {
  const ItemSubCategoryCard({
    super.key,
    required this.image,
    required this.name,
    required this.id,
    required this.price,
    required this.categoryId,
    required this.cubit,
  });

  final String image;
  final String name;
  final String id;
  final String price;
  final int categoryId;
  final SubCategoryCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Container(
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
          SizedBox(height: 4),
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
                    context.read<SubCategoryCubit>().deleteSubCategory(
                      int.parse(id), // subCategoryId
                      categoryId,    // categoryId الأب
                    );
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
                Text("ID: $id", style: TextStyles.font14deepGreyColorW400),
                IconButton(
                  icon: Icon(Icons.edit_outlined, color: ColorManager.primaryColor),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        final TextEditingController nameController =
                        TextEditingController(text: name);
                        final TextEditingController priceController =
                        TextEditingController(text: price);
                        File? newImage;

                        return AlertDialog(
                          title: const Text("Edit Sub Category"),
                          content: Column(
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
                          actions: [
                            TextButton(
                              onPressed: () {
                                if (nameController.text.isNotEmpty) {
                                  cubit.updateSubCategory(
                                    int.parse(id),
                                    nameController.text,
                                    newImage!.path,
                                    double.parse(priceController.text),
                                    categoryId,
                                  );
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
    );
  }
}
