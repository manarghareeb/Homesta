import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/core/theming/styles.dart';

class ProductDescriptionSection extends StatelessWidget {
  const ProductDescriptionSection({super.key, required this.description, required this.price});
final String description;

final String price;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Product Details ',
          style: TextStyles.font16BlackRegular.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 8.h),
        Text(
         description,
         // 'Lorem ipsum dolor sit amet consectetur. Nec aliquam morbi lacus habitasse amet. Nunc dui dictum facilisi faucibus amet sitaliquam morbi lacus habitasse amet. Nunc dui dictum facilisi faucibus amet sit',
          style: TextStyles.font14GreyColorW400,
        ),
        SizedBox(height: 16.h),
        RichText(
          text: TextSpan(
            text: 'Total Price: ',
            style: TextStyles.font14BlackColorW400.copyWith(
              fontWeight: FontWeight.w500,
            ),
            children: [
              TextSpan(text: '\$50.0', style: TextStyles.font14ThirdColorW400),
            ],
          ),
          textAlign: TextAlign.start,
        ),
      ],
    );
  }
}
