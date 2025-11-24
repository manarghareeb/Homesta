import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/features/account/presentation/widgets/select_gender_button.dart';

class GenderSelector extends StatefulWidget {
  const GenderSelector({super.key});

  @override
  State<GenderSelector> createState() => _GenderSelectorState();
}

class _GenderSelectorState extends State<GenderSelector> {
  String selectedGender = 'female';

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SelectGenderButton(
          gender: 'male',
          selectedGender: selectedGender,
          text: 'Male',
          onTap: () {
            setState(() {
              selectedGender = 'male';
            });
          },
        ),
        SizedBox(width: 20.w),
        SelectGenderButton(
          gender: 'female',
          selectedGender: selectedGender,
          text: 'Female',
          onTap: () {
            setState(() {
              selectedGender = 'female';
            });
          },
        ),
      ],
    );
  }
}
