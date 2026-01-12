import 'package:flutter/material.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/theming/styles.dart';

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
        Text('Sort by:', style: TextStyles.font16BlackRegular),
        const SizedBox(width: 16),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            color: ColorManager.aliceBlue,
            borderRadius: BorderRadius.circular(15),
          ),
          child: DropdownButton<String>(
            borderRadius: BorderRadius.circular(8),
            focusColor: Colors.white,
            dropdownColor: Colors.white,
            value: selected,
            underline: const SizedBox(),
            items: [
              DropdownMenuItem(
                value: 'Default Sorting',
                child: Text(
                  'Default Sorting',
                  style: TextStyles.font15BlackW400,
                ),
              ),
              DropdownMenuItem(
                value: 'Price: Low to High',
                child: Text(
                  'Price: Low to High',
                  style: TextStyles.font15BlackW400,
                ),
              ),
              DropdownMenuItem(
                value: 'Price: High to Low',
                child: Text(
                  'Price: High to Low',
                  style: TextStyles.font15BlackW400,
                ),
              ),
            ],
            onChanged: (value) => setState(() => selected = value!),
          ),
        ),
        const Spacer(),
        IconButton(
          icon: const Icon(Icons.tune),
          onPressed: () {
            final scaffold = Scaffold.maybeOf(context);
            if (scaffold != null) scaffold.openEndDrawer();
          },
        ),

        /*Builder(
          builder:
              (context) => IconButton(
                icon: const Icon(Icons.tune),
                onPressed: () => Scaffold.of(context).openEndDrawer(),
              ),
        ),*/
      ],
    );
  }
}
