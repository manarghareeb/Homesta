import 'package:flutter/material.dart';
import 'package:homesta/core/theming/colors.dart';

class SortRowWidget extends StatefulWidget {
  const SortRowWidget({super.key});

  @override
  State<SortRowWidget> createState() => _SortRowWidgetState();
}

class _SortRowWidgetState extends State<SortRowWidget> {
  String selected = 'Default Sorting';

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          'Sort by:',
          style: TextStyle(color: ColorManager.blackColor),
        ),
        const SizedBox(width: 8),

        DropdownButton<String>(
          value: selected,
          underline: const SizedBox(),
          items: const [
            DropdownMenuItem(
              value: 'Default Sorting',
              child: Text('Default Sorting'),
            ),
            DropdownMenuItem(
              value: 'Price: Low to High',
              child: Text('Price: Low to High'),
            ),
            DropdownMenuItem(
              value: 'Price: High to Low',
              child: Text('Price: High to Low'),
            ),
          ],
          onChanged: (value) => setState(() => selected = value!),
        ),

        const Spacer(),

        Builder(
          builder:
              (context) => IconButton(
                icon: const Icon(Icons.tune),
                onPressed: () => Scaffold.of(context).openEndDrawer(),
              ),
        ),
      ],
    );
  }
}
