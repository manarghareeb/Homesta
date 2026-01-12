import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:homesta/core/api/api_keys.dart';
import 'package:homesta/core/cache/cache_helper.dart';
import 'package:homesta/core/routing/app_router.dart';
import 'package:homesta/core/widgets/custom_button_widget.dart';
import 'package:homesta/core/widgets/custom_text_field_widget.dart';
import 'package:homesta/core/widgets/snack_bar.dart';
import 'package:homesta/features/seller/profile/domain/entites/params/create_store_params.dart';
import 'package:homesta/features/seller/profile/presentation/cubits/store_cubit.dart';
import 'package:homesta/features/seller/profile/presentation/cubits/store_state.dart';
import 'package:homesta/features/seller/profile/presentation/views/widgets/communication_row.dart';
import 'package:homesta/features/seller/profile/presentation/views/widgets/custom_text.dart';


class CreateStoreForm extends StatefulWidget {
  const CreateStoreForm({super.key});

  @override
  State<CreateStoreForm> createState() => _CreateStoreFormState();
}

class _CreateStoreFormState extends State<CreateStoreForm> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController workingHoursController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  bool hasWhatsapp = false;
  bool hasSms = false;

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    workingHoursController.dispose();
    addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StoreCubit, StoreState>(
      listener: (context, state) {
        if (state is StoreSuccess) {
          showSnackBar(context, "store created successfully");
    CacheHelper().saveData(key: ApiKeys.storeId, value: state.storeEntity.storeId);
         context.push(AppRouter.sellerAccountScreen);
       
        }
         else if (state is StoreError) {
  showSnackBar(context, state.message);
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              spacing: 5,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(text: "Store Name"),
        
                CustomTextFieldWidget(
                  controller: nameController,
                  hintText: 'Enter Store name',
                  textInputType: TextInputType.text,
                  title: 'Store Name',
                  fillColor: Colors.white,
                  isFilled: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter store name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                CustomText(text: "Store Email"),
                CustomTextFieldWidget(
                  controller: emailController,
                  hintText: 'Enter Store email',
                  textInputType: TextInputType.text,
                  title: 'Store Email',
                  fillColor: Colors.white,
                  isFilled: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter store email';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                CustomText(text: "Store Phone"),
                CustomTextFieldWidget(
                  controller: phoneController,
                  hintText: 'Enter Store phone',
                  textInputType: TextInputType.text,
                  title: 'Store phone',
                  fillColor: Colors.white,
                  isFilled: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter store phone';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                CustomText(text: "Store Working Hours"),
                CustomTextFieldWidget(
                  controller: workingHoursController,
                  hintText: 'Enter Store working hours',
                  textInputType: TextInputType.text,
                  title: 'Store Name',
                  fillColor: Colors.white,
                  isFilled: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter store working hours';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                CustomText(text: "Store Address"),
                CustomTextFieldWidget(
                  controller: addressController,
                  hintText: 'Enter Store address',
                  textInputType: TextInputType.text,
                  title: 'Store Name',
                  fillColor: Colors.white,
                  isFilled: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter store address';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                Text("COMMUNICATION CHANNEL "),
                CommunicationRow(
                  onChanged: (whatsapp, sms) {
                    hasWhatsapp = whatsapp;
                    hasSms = sms;
                  },
                ),
                SizedBox(height: 10),
                state is StoreLoading
                    ? Center(child: CircularProgressIndicator())
                    : CustomButtonWidget(
                        buttonText: "Create Store",
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            final params = CreateStoreParams(
                              name: nameController.text,
                              phone: phoneController.text,
                              email: emailController.text,
                              address: addressController.text,
                              workingHours: workingHoursController.text,
                              hasWhatsapp: hasWhatsapp,
                              hasSms: hasSms,
                            );
                           // context.read<StoreCubit>().createStore(params);
                            context.push( AppRouter.sellerAccountScreen);
                          }
                        },
                        minWidth: double.infinity,
                      )
              ],
            ),
          ),
        );
      },
    );
  }
}
