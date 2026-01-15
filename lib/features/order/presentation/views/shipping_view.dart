import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/core/api/api_keys.dart';
import 'package:homesta/core/cache/cache_helper.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/theming/styles.dart';
import 'package:homesta/core/widgets/custom_button_widget.dart';
import 'package:homesta/core/widgets/custom_text_field_widget.dart';
import 'package:homesta/features/account/presentation/cubit/edit_profile_cubit.dart';
import 'package:homesta/features/account/presentation/cubit/edit_profile_state.dart';
import 'package:homesta/features/account/presentation/widgets/selected_country.dart';
import 'package:homesta/core/widgets/title_to_text_field.dart';
import 'package:dio/dio.dart';

class ShippingView extends StatefulWidget {
  final Function(Map<String, dynamic> shippingData) onNext;
  final VoidCallback onBack;

  const ShippingView({super.key, required this.onNext, required this.onBack});

  @override
  State<ShippingView> createState() => _ShippingViewState();
}

class _ShippingViewState extends State<ShippingView> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController zipCodeController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  String? selectedCountry;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  void _loadUserData() {
    final userId = CacheHelper().getDataString(key: ApiKeys.id);
    if (userId != null) {
      final cubit = context.read<EditProfileCubit>();
      cubit.loadUser(userId);
      cubit.stream.firstWhere((state) => state is EditProfileLoaded).then((
        state,
      ) {
        final loadedState = state as EditProfileLoaded;
        if (mounted) {
          setState(() {
            firstNameController.text = loadedState.user.firstName ?? '';
            lastNameController.text = loadedState.user.lastName ?? '';
            emailController.text = loadedState.user.email ?? '';
            phoneController.text = loadedState.user.phoneNumber ?? '';
            addressController.text = loadedState.user.address ?? '';
            zipCodeController.text = loadedState.user.zipCode ?? '';
            selectedCountry = loadedState.user.country;
          });
        }
      });
    }
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    addressController.dispose();
    zipCodeController.dispose();
    cityController.dispose();
    super.dispose();
  }

  void _onContinue() async {
    if (!_formKey.currentState!.validate()) return;
    final userId = CacheHelper().getDataString(key: ApiKeys.id);
    final shippingData = {
      'info': {
        'firstName': firstNameController.text.trim(),
        'lastName': lastNameController.text.trim(),
        'email': emailController.text.trim(),
        'phone': phoneController.text.trim(),
        'address': addressController.text.trim(),
        'zipCode': zipCodeController.text.trim(),
        'city': cityController.text.trim(),
        'country': selectedCountry ?? '',
      },
      if (userId != null) 'userId': userId,
    };

    final confirmSave = await showDialog<bool>(
      context: context,
      builder:
          (context) => AlertDialog(
            backgroundColor: Colors.white,
            title: const Text('Save Personal Data?'),
            content: const Text(
              'Do you want to save this shipping information in your personal data?',
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            actionsPadding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 8.h,
            ),
            actions: [
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: ColorManager.primaryColor),
                  foregroundColor: ColorManager.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('No'),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorManager.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () => Navigator.of(context).pop(true),
                child: Text('Yes', style: TextStyles.font14WhiteColorW400),
              ),
            ],
          ),
    );

    if (confirmSave == true && userId != null) {
      final infoMap = Map<String, dynamic>.from(
        shippingData['info'] as Map<String, String>,
      );
      infoMap['UserId'] = userId;
      final formData = FormData.fromMap(infoMap);
      try {
        await context.read<EditProfileCubit>().updateUser(formData, userId);
      } catch (e, stack) {
        debugPrint('Error updating user: $e');
        debugPrintStack(stackTrace: stack);
      }
    }
    widget.onNext(shippingData);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Row(
              children: [
                Icon(Icons.arrow_downward_outlined),
                SizedBox(width: 8.w),
                Text('Delivery Address', style: TextStyles.font16BlackW500),
              ],
            ),
            SizedBox(height: 24.h),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TitleToTextField(title: 'First Name'),
                      SizedBox(height: 8.h),
                      CustomTextFieldWidget(
                        controller: firstNameController,
                        hintText: 'Maram',
                        textInputType: TextInputType.name,
                        title: '',
                        validator:
                            (value) =>
                                value == null || value.isEmpty
                                    ? 'Required'
                                    : null,
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 16.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TitleToTextField(title: 'Last Name'),
                      SizedBox(height: 8.h),
                      CustomTextFieldWidget(
                        controller: lastNameController,
                        hintText: 'Elamly',
                        textInputType: TextInputType.name,
                        title: '',
                        validator:
                            (value) =>
                                value == null || value.isEmpty
                                    ? 'Required'
                                    : null,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            TitleToTextField(title: 'Email'),
            SizedBox(height: 8.h),
            TextFormField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              enabled: false,
              decoration: const InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.h),
            TitleToTextField(title: 'Phone'),
            SizedBox(height: 8.h),
            CustomTextFieldWidget(
              controller: phoneController,
              hintText: '12345678901',
              textInputType: TextInputType.phone,
              title: '',
              validator:
                  (value) => value == null || value.isEmpty ? 'Required' : null,
            ),
            SizedBox(height: 16.h),
            TitleToTextField(title: 'Address'),
            SizedBox(height: 8.h),
            CustomTextFieldWidget(
              controller: addressController,
              hintText: 'Nasr City',
              textInputType: TextInputType.streetAddress,
              title: '',
              validator:
                  (value) => value == null || value.isEmpty ? 'Required' : null,
            ),
            SizedBox(height: 16.h),
            TitleToTextField(title: 'Zip Code'),
            SizedBox(height: 8.h),
            CustomTextFieldWidget(
              controller: zipCodeController,
              hintText: '23451678',
              textInputType: TextInputType.phone,
              title: '',
              validator:
                  (value) => value == null || value.isEmpty ? 'Required' : null,
            ),
            SizedBox(height: 16.h),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TitleToTextField(title: 'City'),
                      SizedBox(height: 8.h),
                      CustomTextFieldWidget(
                        controller: cityController,
                        hintText: 'Giza',
                        textInputType: TextInputType.streetAddress,
                        title: '',
                        validator:
                            (value) =>
                                value == null || value.isEmpty
                                    ? 'Required'
                                    : null,
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 16.w),
                Expanded(
                  child: SelectedCountry(
                    onCountrySelected: (country) {
                      setState(() {
                        selectedCountry = country;
                      });
                    },
                    initialCountry: selectedCountry,
                  ),
                ),
              ],
            ),
            SizedBox(height: 24.h),
            CustomButtonWidget(
              buttonText: 'Continue to Payment',
              onPressed: _onContinue,
            ),
          ],
        ),
      ),
    );
  }
}
