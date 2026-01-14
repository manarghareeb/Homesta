import 'package:flutter/material.dart';
import 'package:homesta/core/theming/colors.dart';

class FilterPriceSlider extends StatefulWidget {
  const FilterPriceSlider({super.key, this.onPriceChanged});
  //final void Function(double start, double end) onPriceChanged;
  final Function(double, double)? onPriceChanged;

  @override
  State<FilterPriceSlider> createState() => _FilterPriceSliderState();
}

class _FilterPriceSliderState extends State<FilterPriceSlider> {
  RangeValues values = const RangeValues(25.00, 10000.00);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '\$${values.start.toInt()} - \$${values.end.toInt()}',
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
        RangeSlider(
          values: values,
          min: 0.00,
          max: 10000.00,
          divisions: 100,
          activeColor: ColorManager.primaryColor,
          inactiveColor: ColorManager.lightGreyIconColor,
          onChanged: (val) {
            setState(() => values = val);
            if (widget.onPriceChanged != null) {
              widget.onPriceChanged!(values.start, values.end);
            }
          },
        ),
      ],
    );
  }
}
