import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/widgets/custom_app_bar_widget.dart';
import 'package:homesta/core/widgets/custom_button_widget.dart';
import 'package:homesta/core/widgets/custom_text_field_widget.dart';
import 'package:homesta/core/widgets/snack_bar.dart';
import 'package:homesta/features/seller/product/data/models/product_seller_model.dart';
import 'package:homesta/features/seller/product/domain/entitiy/params/add_product_params.dart';
import 'package:homesta/features/seller/product/presentation/cubits/saller_product_cubit.dart';
import 'package:homesta/features/seller/product/presentation/cubits/saller_product_state.dart';
import 'package:homesta/features/seller/product/presentation/widgets/image_upload.dart';
import 'package:homesta/features/seller/product/presentation/widgets/select_category.dart';
import 'package:homesta/features/seller/product/presentation/widgets/stock_input_field.dart';

class ProductFormScreen extends StatefulWidget {
  const ProductFormScreen({super.key, this.product});
  final Product? product;

  @override
  State<ProductFormScreen> createState() => _ProductFormScreenState();
}

class _ProductFormScreenState extends State<ProductFormScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController priceController = TextEditingController();
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
    colorController = TextEditingController(
      text: widget.product?.colorName ?? '',
    );
    stockController = TextEditingController(
      text: widget.product?.stock.toString() ?? '',
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
              return Column(
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
                  ),
                  SizedBox(height: 16.h),
                  const SelectCategory(),
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
                  ),
                  SizedBox(height: 16.h),
                  CustomTextFieldWidget(
                    prefixIcon: Icons.price_change_outlined,
                    controller: priceController,
                    hintText: 'product Price',
                    textInputType: TextInputType.text,
                    title: 'Product Price',
                    fillColor: Colors.white,
                    isFilled: true,
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
                  ),
                  SizedBox(height: 16.h),
                  StockInputField(
                    initialStock: widget.product?.stock ?? 0,
                    onChanged: (value) {
                      stockController.text = value.toString();
                    },
                  ),
                  SizedBox(height: 24.h),
                  CustomButtonWidget(
                    buttonText: 'Save',
                    onPressed: ()async {
                      BlocProvider.of<SellerProductCubit>(
                        context,
                      ).addSellerProducts(
                        AddProductParams(
                          deliveryTime:1,
                          rating: 0,

                          name: "aaa",
                          description: "aaa",
                          price: 122,
                          colors: ["aaa"],
                          quantity: 1,
                          discount: 0,
                          subCategoryId: 1,
                          categoryId: 1,
                          storeId: 1,
                        ),
                      );
                    },
                  ),
                ],
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
