import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/theming/styles.dart';
import 'package:homesta/core/widgets/custom_app_bar_widget.dart';
import 'package:homesta/core/widgets/custom_button_widget.dart';
import 'package:homesta/core/widgets/custom_text_field_widget.dart';

import '../../../../core/widgets/custom_dropdown_widget.dart';
import '../widgets/custom_saved_address_widget.dart';

class ManageAddressScreen extends StatefulWidget {
  const ManageAddressScreen({super.key});

  @override
  State<ManageAddressScreen> createState() => _ManageAddressScreenState();
}

class _ManageAddressScreenState extends State<ManageAddressScreen> {
  // Controllers
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final companyController = TextEditingController();
  final streetController = TextEditingController();
  final zipController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();

  String? selectedCountry;
  String? selectedCity;
  String? selectedState;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBarWidget(text: "Manage Address"),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SavedAddressWidget(
              name: "Bessie Cooper",
              address: "2464 Royal Ln. Mesa, New Jersey 45463",
              onEdit: () {},
              onDelete: () {},
            ),
            SizedBox(height: 20.h),
            SavedAddressWidget(
              name: "Bessie Cooper",
              address: "2464 Royal Ln. Mesa, New Jersey 45463",
              onEdit: () {},
              onDelete: () {},
            ),
            SizedBox(height: 20.h),
            Text("Add New Address", style: TextStyles.font18BoldBlack),
            SizedBox(height: 16.h),
            Container(
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: ColorManager.soLightGreyColor,
                borderRadius: BorderRadius.circular(12.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    blurRadius: 12,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 16.h),
                  _buildLabel("First Name", required: true),
                  CustomTextFieldWidget(
                    controller: firstNameController,
                    hintText: "Enter First Name",
                    textInputType: TextInputType.name, title: '',
                  ),
                  SizedBox(height: 12.h),

                  _buildLabel("Last Name", required: true),
                  CustomTextFieldWidget(
                    controller: lastNameController,
                    hintText: "Enter Last Name",
                    textInputType: TextInputType.name, title: '',
                  ),
                  SizedBox(height: 12.h),

                  _buildLabel("Company Name (Optional)"),
                  CustomTextFieldWidget(
                    controller: companyController,
                    hintText: "Enter Company Name",
                    textInputType: TextInputType.text, title: '',
                  ),
                  SizedBox(height: 12.h),

                  _buildLabel("Country", required: true),
                  CustomDropdownWidget(
                    label: "Country",
                    value: selectedCountry,
                    items: ["Jordan", "USA", "UK"],
                    onChanged: (val) => setState(() => selectedCountry = val),
                  ),
                  SizedBox(height: 12.h),
                  _buildLabel("Street Address", required: true),
                  CustomTextFieldWidget(
                    controller: streetController,
                    hintText: "Enter Street Address",
                    textInputType: TextInputType.streetAddress, title: '',
                  ),
                  SizedBox(height: 12.h),

                  _buildLabel("City", required: true),
                  CustomDropdownWidget(
                    label: "City",
                    value: selectedCity,
                    items: ["Amman", "Zarqa", "Irbid"],
                    onChanged: (val) => setState(() => selectedCity = val),
                  ),
                  SizedBox(height: 12.h),

                  _buildLabel("State", required: true),
                  CustomDropdownWidget(
                    label: "State",
                    value: selectedState,
                    items: ["State 1", "State 2"],
                    onChanged: (val) => setState(() => selectedState = val),
                  ),
                  SizedBox(height: 12.h),
                  _buildLabel("Zip Code", required: true),
                  CustomTextFieldWidget(
                    controller: zipController,
                    hintText: "Enter Zip Code",
                    textInputType: TextInputType.number, title: '',
                  ),
                  SizedBox(height: 12.h),

                  _buildLabel("Phone", required: true),
                  CustomTextFieldWidget(
                    controller: phoneController,
                    hintText: "Enter Phone Number",
                    textInputType: TextInputType.phone, title: '',
                  ),
                  SizedBox(height: 12.h),

                  _buildLabel("Email", required: true),
                  CustomTextFieldWidget(
                    controller: emailController,
                    hintText: "Enter Email Address",
                    textInputType: TextInputType.emailAddress, title: '',
                  ),
                  SizedBox(height: 20.h),

                  CustomButtonWidget(
                    buttonText: "Save Address",
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text("Address Saved Successfully")),
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

  /// ويدجت للـ Label مع نجمة إذا Required
  Widget _buildLabel(String text, {bool required = false}) {
    return Padding(
      padding: EdgeInsets.only(bottom: 6.h),
      child: RichText(
        text: TextSpan(
          text: text,
          style: TextStyles.font16BlackRegular,
          children: required
              ? [
            TextSpan(
              text: " *",
              style: TextStyles.font14BlackColorW400.copyWith(color: Colors.red),
            ),
          ]
              : [],
        ),
      ),
    );
  }
}
