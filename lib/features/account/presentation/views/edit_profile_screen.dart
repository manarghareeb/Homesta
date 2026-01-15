import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dio/dio.dart';
import 'package:homesta/features/account/presentation/widgets/selected_country.dart';
import 'package:image_picker/image_picker.dart';
import 'package:homesta/core/widgets/custom_app_bar_widget.dart';
import 'package:homesta/core/widgets/custom_button_widget.dart';
import 'package:homesta/features/account/presentation/widgets/photo_profile.dart';
import 'package:homesta/features/account/presentation/widgets/text_and_text_field.dart';
import 'package:homesta/features/account/presentation/cubit/edit_profile_cubit.dart';
import 'package:homesta/features/account/presentation/cubit/edit_profile_state.dart';
import '../../../../core/api/api_keys.dart';
import '../../../../core/cache/cache_helper.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController birthDateController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController zipCodeController = TextEditingController();
  final TextEditingController customCountryController = TextEditingController();

  String? selectedCountry;
  String? selectedGender;
  XFile? pickedImage;
  String? imageUrl; // رابط الصورة من السيرفر

  @override
  void initState() {
    super.initState();
    final userId = CacheHelper().getData(key: ApiKeys.id);
    context.read<EditProfileCubit>().loadUser(userId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EditProfileCubit, EditProfileState>(
      listener: (context, state) {
        if (state is EditProfileLoaded) {
          final user = state.user;
          firstNameController.text = user.firstName ?? "";
          lastNameController.text = user.lastName ?? "";
          emailController.text = user.email ?? "";
          phoneController.text = user.phoneNumber ?? "";
          birthDateController.text = user.birthdate ?? "";
          addressController.text = user.address ?? "";
          zipCodeController.text = user.zipCode ?? "";
          selectedCountry = user.country;
          selectedGender = user.gender;
          imageUrl =
              user.imagePath != null
                  ? "http://homefinish.runasp.net${user.imagePath}"
                  : null;
          setState(() {});
        } else if (state is EditProfileSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Profile updated successfully")),
          );
        } else if (state is EditProfileFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: CustomAppBarWidget(text: 'Edit Profile'),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  PhotoProfile(
                    onImageSelected:
                        (image) => setState(() => pickedImage = image),
                    initialImageUrl: imageUrl,
                  ),
                  SizedBox(height: 24.h),

                  TextAndTextField(
                    controller: firstNameController,
                    hintText: 'First Name',
                    textInputType: TextInputType.name,
                    textLabel: 'First Name',
                  ),
                  TextAndTextField(
                    controller: lastNameController,
                    hintText: 'Last Name',
                    textInputType: TextInputType.name,
                    textLabel: 'Last Name',
                  ),

                  // حقل الإيميل ثابت وغير قابل للتعديل
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

                  TextAndTextField(
                    controller: phoneController,
                    hintText: 'Mobile Number',
                    textInputType: TextInputType.phone,
                    textLabel: 'Mobile Number',
                  ),
                  SizedBox(height: 8.h),

                  DropdownButtonFormField<String>(
                    dropdownColor: Colors.white,
                    value: selectedGender,
                    decoration: const InputDecoration(
                      labelText: "Gender",
                      border: OutlineInputBorder(),
                    ),
                    items:
                        const ["MALE", "FEMALE"]
                            .map(
                              (gender) => DropdownMenuItem(
                                value: gender,
                                child: Text(
                                  gender == "MALE" ? "Male" : "Female",
                                ),
                              ),
                            )
                            .toList(),
                    onChanged:
                        (value) => setState(() => selectedGender = value),
                  ),
                  SizedBox(height: 16.h),

                  SelectedCountry(
                    onCountrySelected: (country) {
                      setState(() {
                        selectedCountry = country;
                      });
                    },
                    initialCountry: selectedCountry,
                  ),
                  SizedBox(height: 16.h),

                  if (selectedCountry == "Other")
                    TextAndTextField(
                      controller: customCountryController,
                      hintText: 'Enter your country',
                      textInputType: TextInputType.text,
                      textLabel: 'Custom Country',
                    ),

                  SizedBox(height: 16.h),
                  TextAndTextField(
                    controller: addressController,
                    hintText: 'Address',
                    textInputType: TextInputType.text,
                    textLabel: 'Address',
                  ),
                  SizedBox(height: 16.h),
                  TextAndTextField(
                    controller: zipCodeController,
                    hintText: 'Zip Code',
                    textInputType: TextInputType.number,
                    textLabel: 'Zip Code',
                  ),

                  SizedBox(height: 32.h),
                  CustomButtonWidget(
                    buttonText:
                        state is EditProfileLoading
                            ? "Saving..."
                            : "Save Changes",
                    onPressed: () async {
                      final countryToSend =
                          selectedCountry == "Other"
                              ? customCountryController.text
                              : (selectedCountry ?? "");

                      MultipartFile? imageFile;
                      if (pickedImage != null) {
                        imageFile = await MultipartFile.fromFile(
                          pickedImage!.path,
                          filename: pickedImage!.name,
                        );
                      }

                      final formData = FormData.fromMap({
                        "FirstName": firstNameController.text,
                        "LastName": lastNameController.text,
                        "Email": emailController.text,
                        "PhoneNumber": phoneController.text,
                        "Birthdate": birthDateController.text,
                        "Gender": selectedGender ?? "",
                        //"Country": countryToSend,
                        "Country": selectedCountry ?? "",
                        "ZipCode": zipCodeController.text,
                        "Address": addressController.text,
                        if (imageFile != null) "ImageFile": imageFile,
                      });

                      final userId = CacheHelper().getData(key: ApiKeys.id);
                      context.read<EditProfileCubit>().updateUser(
                        formData,
                        userId,
                      );
                    },
                  ),
                  SizedBox(height: 40.h),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
