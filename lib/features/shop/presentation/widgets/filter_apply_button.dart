import 'package:flutter/material.dart';
import 'package:homesta/core/theming/colors.dart';

class FilterApplyButton extends StatelessWidget {
  const FilterApplyButton({super.key, required Null Function() onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorManager.primaryColor,
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: () => Navigator.pop(context),
        child: const Text(
          'Apply Filters',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
