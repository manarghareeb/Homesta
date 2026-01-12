import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/core/api/api_keys.dart';
import 'package:homesta/core/cache/cache_helper.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/widgets/custom_app_bar_widget.dart';
import 'package:homesta/core/widgets/custom_button_widget.dart';
import 'package:homesta/core/widgets/custom_text_field_widget.dart';
import 'package:homesta/core/widgets/snack_bar.dart';
import 'package:homesta/features/categories/presentation/cubits/sub_category_cubit.dart/sub_category_cubit.dart';
import 'package:homesta/features/product/domain/entities/product_entitty.dart';
import 'package:homesta/features/seller/product/domain/entitiy/params/add_product_params.dart';
import 'package:homesta/features/seller/product/presentation/cubits/saller_product_cubit.dart';
import 'package:homesta/features/seller/product/presentation/cubits/saller_product_state.dart';
import 'package:homesta/features/seller/product/presentation/widgets/image_upload.dart';
import 'package:homesta/features/seller/product/presentation/widgets/select_category.dart';
import 'package:homesta/features/seller/product/presentation/widgets/select_sub_category.dart';
import 'package:homesta/features/seller/product/presentation/widgets/stock_input_field.dart';

class ProductFormScreen extends StatefulWidget {
  const ProductFormScreen({super.key, this.product});
  final ProductEntity? product;

  @override
  State<ProductFormScreen> createState() => _ProductFormScreenState();
}

class _ProductFormScreenState extends State<ProductFormScreen> {
  int? selectedCategoryId;
  int? selectedSubCategoryId;

  final _formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController discountController = TextEditingController();
  TextEditingController colorController = TextEditingController();
  TextEditingController stockController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.product?.name ?? '');
    descriptionController = TextEditingController(
      text: widget.product?.description ?? '',
    );
    priceController = TextEditingController(
      text: widget.product?.price.toString() ?? '',
    );
    discountController = TextEditingController(
      text: widget.product?.discount.toString() ?? '',
    );
    colorController = TextEditingController(
      text: widget.product?.colors.first ?? '',
    );
    stockController = TextEditingController(
      text: widget.product?.quantity.toString() ?? '',
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    descriptionController.dispose();
    priceController.dispose();
    colorController.dispose();
    stockController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isEdit = widget.product != null;
    return Scaffold(
      backgroundColor: ColorManager.soLightGreyColor,
      appBar: CustomAppBarWidget(
        text: isEdit ? 'Edit Product' : 'Add Product',
        backgroundColor: ColorManager.soLightGreyColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
          child: BlocConsumer<SellerProductCubit, SellerProductState>(
            builder: (context, state) {
              return Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextFieldWidget(
                      prefixIcon: Icons.production_quantity_limits_outlined,
                      controller: nameController,
                      hintText: 'Enter product name',
                      textInputType: TextInputType.text,
                      title: 'Product Name',
                      fillColor: Colors.white,
                      isFilled: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter product name';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16.h),
                    SelectCategory(
                      initialCategoryId: widget.product?.categoryId,
                      onCategorySelected: (categoryId) {
                        setState(() {
                          selectedCategoryId = categoryId;
                          selectedSubCategoryId = null; // reset sub
                        });
                        // جلب SubCategories من Cubit
                        context.read<SubCategoryCubit>().getSubCategories(
                          categoryId,
                        );
                      },
                    ),
                    SizedBox(height: 16.h),
                    // بعد كده Dropdown SubCategory
                    if (selectedCategoryId != null)
                      SelectSubCategory(
                        categoryId: selectedCategoryId!,
                        initialSubCategoryId: widget.product?.subCategoryId,
                        onSubCategorySelected: (subId) {
                          setState(() {
                            selectedSubCategoryId = subId;
                          });
                        },
                      ),

                    SizedBox(height: 16.h),
                    ImageUpload(isEdit: isEdit, product: widget.product),
                    SizedBox(height: 16.h),
                    CustomTextFieldWidget(
                      prefixIcon: Icons.description_outlined,
                      controller: descriptionController,
                      hintText: 'product Description',
                      textInputType: TextInputType.text,
                      title: 'Product Description',
                      fillColor: Colors.white,
                      isFilled: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter product description';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16.h),
                    CustomTextFieldWidget(
                      prefixIcon: Icons.price_change_outlined,
                      controller: priceController,
                      hintText: 'product Price',
                      textInputType: TextInputType.number,
                      title: 'Product Price',
                      fillColor: Colors.white,
                      isFilled: true,

                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter product price';
                        }

                        return null;
                      },
                    ),
                    SizedBox(height: 16.h),
                    CustomTextFieldWidget(
                      prefixIcon: Icons.price_change_outlined,
                      controller: discountController,
                      hintText: 'product Discount',
                      textInputType: TextInputType.number,
                      title: 'Product Discount',
                      fillColor: Colors.white,
                      isFilled: true,

                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter product discount';
                        }

                        return null;
                      },
                    ),
                    SizedBox(height: 16.h),
                    CustomTextFieldWidget(
                      prefixIcon: Icons.color_lens_outlined,
                      controller: colorController,
                      hintText: 'product Color',
                      textInputType: TextInputType.text,
                      title: 'Product Color',
                      fillColor: Colors.white,
                      isFilled: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter product color';
                        }

                        return null;
                      },
                    ),
                    SizedBox(height: 16.h),
                    StockInputField(
                      initialStock: widget.product?.quantity ?? 0,
                      onChanged: (value) {
                        stockController.text = value.toString();
                      },
                    ),
                    SizedBox(height: 24.h),
                    state is SellerAddProductLoading
                        ? const CircularProgressIndicator()
                        : CustomButtonWidget(
                          buttonText: 'Save',
                          onPressed: () async {
                            if (!_formKey.currentState!.validate()) {
                              return;
                            }
                            if (selectedCategoryId == null) {
                              showSnackBar(context, "اختاري Category");
                              return;
                            }

                            final params = AddProductParams(
                              name: nameController.text.trim(),
                              description: descriptionController.text.trim(),
                              price: int.parse(priceController.text),
                              colors: [colorController.text.trim()],
                              quantity: int.parse(stockController.text),
                              rating: widget.product?.rating ?? 0,
                              discount: int.parse(discountController.text),
                              deliveryTime: 1,
                              categoryId: selectedCategoryId!,
                              subCategoryId: selectedSubCategoryId!,
                              storeId: CacheHelper().getData(key: ApiKeys.storeId)
                            );

                            context
                                .read<SellerProductCubit>()
                                .addSellerProducts(params);
                          },
                        ),
                  ],
                ),
              );
            },
            listener: (BuildContext context, SellerProductState state) {
              if (state is SellerAddProductSuccess) {
                showSnackBar(context, "added successfully");
              }
              if (state is SellerAddProductError) {
                showSnackBar(context, state.message);
              }
            },
          ),
        ),
      ),
    );
  }
}
