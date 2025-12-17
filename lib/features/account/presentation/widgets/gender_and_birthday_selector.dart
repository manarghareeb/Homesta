import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/theming/styles.dart';

class GenderAndBirthdaySelector extends StatefulWidget {
  const GenderAndBirthdaySelector({super.key});

  @override
  State<GenderAndBirthdaySelector> createState() =>
      _GenderAndBirthdaySelectorState();
}

class _GenderAndBirthdaySelectorState extends State<GenderAndBirthdaySelector> {
  String? selectedGender;
  DateTime? selectedBirthday;

  final List<String> genders = ['Male', 'Female'];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  text: 'Gender',
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
              DropdownButtonFormField<String>(
                initialValue: selectedGender,
                items:
                    genders
                        .map(
                          (g) => DropdownMenuItem(
                            value: g,
                            child: Text(
                              g,
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        )
                        .toList(),
                onChanged: (v) => setState(() => selectedGender = v),
                style: TextStyles.font14GreyColorW400,
                dropdownColor: ColorManager.soLightGreyColor,
                decoration: InputDecoration(
                  hintText: 'Gender',
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
              ),
            ],
          ),
        ),
        SizedBox(width: 16.w),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  text: 'Birthday',
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
                decoration: InputDecoration(
                  hintText:
                      selectedBirthday != null
                          ? '${selectedBirthday!.day}/${selectedBirthday!.month}/${selectedBirthday!.year}'
                          : 'Birthday',
                  suffixIcon: const Icon(Icons.calendar_today),
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
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime(2000),
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                    builder: (context, child) {
                      return Theme(
                        data: Theme.of(context).copyWith(
                          colorScheme: ColorScheme.light(
                            primary:
                                ColorManager
                                    .primaryColor, //color of AppBar and Buttons
                            onPrimary:
                                Colors.white, //color of text in AppBar and Buttons
                            surface:
                                ColorManager
                                    .soLightGreyColor, //color of backgournd calendar
                            onSurface: Colors.black, //color of data text
                          ),
                          textButtonTheme: TextButtonThemeData(
                            style: TextButton.styleFrom(
                              foregroundColor:
                                  ColorManager
                                      .primaryColor, //color of Cancel/OK
                            ),
                          ),
                        ),
                        child: child!,
                      );
                    },
                  );
                  if (pickedDate != null) {
                    setState(() => selectedBirthday = pickedDate);
                  }
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
