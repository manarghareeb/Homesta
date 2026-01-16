import 'package:flutter/material.dart';
import 'package:homesta/core/theming/styles.dart';

class DiscriptionTab extends StatelessWidget {
  const DiscriptionTab({super.key, required this.description});
  final String description;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        spacing: 15,
        children: [
          SizedBox(height: 0),
          Text(
            description,
            // "commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
            style: TextStyles.font14GreyColorW400,
          ),
          /*DescriptionRow(
            text:
                "100% Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
          ),
          DescriptionRow(text: "Lorem ipsum dolor sit amet, consectetur. "),
          DescriptionRow(text: "Ut labore et dolore magna aliqua. "),
          DescriptionRow(text: "Duis aute irure dolor in reprehenderit"),
          ExploreProduct(),*/
        ],
      ),
    );
  }
}
