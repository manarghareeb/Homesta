import 'package:flutter/material.dart';
import 'package:homesta/core/theming/colors.dart';

class FilterCheckboxItem extends StatefulWidget {
  final String title;

  const FilterCheckboxItem({super.key, required this.title});

  @override
  State<FilterCheckboxItem> createState() => _FilterCheckboxItemState();
}

class _FilterCheckboxItemState extends State<FilterCheckboxItem> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isChecked = !isChecked;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Row(
          children: [
            Container(
              width: 22,
              height: 22,
              decoration: BoxDecoration(
                color: ColorManager.soLightGreyColor,
                borderRadius: BorderRadius.circular(4),
              ),
              child:
                  isChecked
                      ? const Icon(
                        Icons.check,
                        size: 16,
                        color: ColorManager.primaryColor,
                      )
                      : null,
            ),

            const SizedBox(width: 12),

            Text(widget.title, style: const TextStyle(fontSize: 14)),
          ],
        ),
      ),
    );
  }
}
