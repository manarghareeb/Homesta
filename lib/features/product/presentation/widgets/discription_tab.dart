import 'package:flutter/material.dart';

import 'package:homesta/core/theming/styles.dart';
import 'package:homesta/features/product/presentation/widgets/description_row.dart';
import 'package:homesta/features/product/presentation/widgets/explore_product.dart';

class DiscriptionTab extends StatelessWidget {
  const DiscriptionTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          spacing: 15,
          children: [
            Text(
              "commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
              style: TextStyles.font14GreyColorW400,
            ),
            DescriptionRow(text:  "100% Lorem ipsum dolor sit amet, consectetur adipiscing elit.",),
            DescriptionRow(text: "Lorem ipsum dolor sit amet, consectetur. "),
            DescriptionRow(text: "Ut labore et dolore magna aliqua. "),
            DescriptionRow(text: "Duis aute irure dolor in reprehenderit"),
           // ExploreProduct()
          ],
        ),
        
      ),
    );
  }
}
