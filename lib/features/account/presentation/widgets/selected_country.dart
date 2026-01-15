import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/theming/styles.dart';

class SelectedCountry extends StatefulWidget {
  const SelectedCountry({super.key, this.onCountrySelected, this.initialCountry});
  final Function(String country)? onCountrySelected;
  final String? initialCountry;

  @override
  State<SelectedCountry> createState() => _SelectedCountryState();
}

class _SelectedCountryState extends State<SelectedCountry> {
  String? selectedCountry;

  @override
  void initState() {
    super.initState();
    selectedCountry = widget.initialCountry; 
  }

  @override
  void didUpdateWidget(covariant SelectedCountry oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.initialCountry != widget.initialCountry) {
      setState(() {
        selectedCountry = widget.initialCountry;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: 'Country',
            style: TextStyles.font18BlackW500.copyWith(fontSize: 16.sp),
            children: [
              TextSpan(
                text: '*',
                style: TextStyle(color: ColorManager.redColor),
              ),
            ],
          ),
        ),
        SizedBox(height: 8.h),
        TextFormField(
          style: TextStyles.font14GreyColorW400,
          readOnly: true,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value) =>
              (selectedCountry == null || selectedCountry!.isEmpty)
                  ? 'Please select a country'
                  : null,
          decoration: InputDecoration(
            suffixIcon: const Icon(Icons.arrow_drop_down),
            hintText: selectedCountry ?? 'Choose your country',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide(color: ColorManager.lightGreyColor),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide(color: ColorManager.lightGreyColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide(color: ColorManager.lightGreyColor),
            ),
          ),
          onTap: () {
            showCountryPicker(
              context: context,
              showPhoneCode: false,
              onSelect: (Country country) {
                setState(() {
                  selectedCountry = country.name;
                });
                /*if (widget.onCountrySelected != null) {
                  widget.onCountrySelected!(country.name);
                }*/
                widget.onCountrySelected?.call(country.name);
              },
            );
          },
        ),
      ],
    );
  }
}
