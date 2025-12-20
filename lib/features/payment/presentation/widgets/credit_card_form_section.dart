import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/core/theming/styles.dart';
import 'package:homesta/core/widgets/custom_text_field_widget.dart';
import 'package:homesta/features/authentication/presentation/widgets/title_to_text_field.dart';

class CreditCardFormSection extends StatelessWidget {
  const CreditCardFormSection({
    super.key,
    required this.cardHolderController,
    required this.cardNumberController,
    required this.expiryDateController,
    required this.cvvController,
  });

  final TextEditingController cardHolderController;
  final TextEditingController cardNumberController;
  final TextEditingController expiryDateController;
  final TextEditingController cvvController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 24.h),
        TitleToTextField(
          title: 'Card Holder Name', 
          //textStyle: TextStyles.font14BlackColorW400,
        ),
        SizedBox(height: 8.h),
        CustomTextFieldWidget(
          controller: cardHolderController,
          hintText: 'Enter name on card',
          textInputType: TextInputType.name,
          title: '',
        ),
        SizedBox(height: 16.h),
        TitleToTextField(
          title: 'Card Number', 
          //textStyle: TextStyles.font14BlackColorW400,
        ),
        SizedBox(height: 8.h),
        CustomTextFieldWidget(
          controller: cardNumberController,
          hintText: '1234 5678 9012 3456',
          textInputType: TextInputType.number,
          title: '',
        ),
        SizedBox(height: 16.h),
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TitleToTextField(
                    title: 'Expiry Date', 
                    //textStyle: TextStyles.font14BlackColorW400,
                  ),
                  SizedBox(height: 8.h),
                  CustomTextFieldWidget(
                    controller: expiryDateController,
                    hintText: 'MM/YY',
                    textInputType: TextInputType.datetime,
                    title: '',
                  ),
                ],
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TitleToTextField(
                    title: 'CVV', 
                    //textStyle: TextStyles.font14BlackColorW400,
                  ),
                  SizedBox(height: 8.h),
                  CustomTextFieldWidget(
                    controller: cvvController,
                    hintText: '123',
                    textInputType: TextInputType.number,
                    title: '',
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
