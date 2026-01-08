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
  void didUpdateWidget(covariant ActiveFiltersWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.initialFilters != widget.initialFilters) {
      setState(() {
        filters = List.from(widget.initialFilters);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (filters.isEmpty) return const SizedBox();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      decoration: BoxDecoration(
        color: ColorManager.soLightGreyColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Active Filter',
                style: TextStyles.font16BlackRegular,
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  setState(() {
                    filters.clear();
                  });
                  widget.onClearAll();
                },
                child: Text(
                  'Clear All',
                  style: TextStyles.font16PrimaryColorW400Underline,
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),

          /// Chips
          Wrap(
            spacing: 16,
            //runSpacing: 2,
            children:
                filters.map((filter) {
                  return Chip(
                    backgroundColor: ColorManager.thirdColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    label: Text(
                      filter,
                      style: TextStyles.font13BlackColorW400,
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
