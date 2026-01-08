import 'package:flutter/material.dart';
import 'package:homesta/core/theming/colors.dart';

class FilterCheckboxItem extends StatelessWidget {
  final String title;
  final bool isChecked; 
  final VoidCallback onTap;

  const FilterCheckboxItem({super.key, required this.title, required this.isChecked, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Row(
          children: [
            Container(
              width: 22,
              height: 22,
              decoration: BoxDecoration(
                color: isChecked ? ColorManager.primaryColor : ColorManager.soLightGreyColor,
                borderRadius: BorderRadius.circular(4),
              ),
              child:
                  isChecked
                      ? const Icon(
                        Icons.check,
                        size: 16,
                        color: Colors.white,
                      )
                      : null,
            ),

            const SizedBox(width: 12),

            Text(title, style: const TextStyle(fontSize: 14)),
          ],
        ),
      ),
    );
  }
}
