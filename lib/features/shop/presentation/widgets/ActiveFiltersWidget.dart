import 'package:flutter/material.dart';
import 'package:homesta/core/theming/colors.dart';
import '../../../../core/theming/styles.dart';

class ActiveFiltersWidget extends StatefulWidget {
  const ActiveFiltersWidget({
    super.key,
    required this.initialFilters,
    required this.onClearAll,
    required this.onRemoveFilter,
  });

  final List<String> initialFilters;
  final VoidCallback onClearAll;
  final Function(String filter) onRemoveFilter;

  @override
  State<ActiveFiltersWidget> createState() => _ActiveFiltersWidgetState();
}

class _ActiveFiltersWidgetState extends State<ActiveFiltersWidget> {
  late List<String> filters;

  @override
  void initState() {
    super.initState();
    filters = List.from(widget.initialFilters);
  }

  @override
  Widget build(BuildContext context) {
    if (filters.isEmpty) return const SizedBox();

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: ColorManager.soLightGreyColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text(
                'Active Filter',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  setState(() {
                    filters.clear();
                  });
                  widget.onClearAll();
                },
                child: const Text(
                  'Clear All',
                  style: TextStyle(color: ColorManager.primaryColor),
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          /// Chips
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children:
                filters.map((filter) {
                  return Chip(
                    backgroundColor: ColorManager.thirdColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    label: Text(
                      filter,
                      style: const TextStyle(color: ColorManager.blackColor),
                    ),
                    deleteIcon: Icon(
                      Icons.close,
                      color: TextStyles.font14BlackColorW500.color,
                    ),
                    onDeleted: () {
                      setState(() {
                        filters.remove(filter);
                      });
                      widget.onRemoveFilter(filter);
                    },
                  );
                }).toList(),
          ),
        ],
      ),
    );
  }
}
