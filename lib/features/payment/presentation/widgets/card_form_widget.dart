import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/theming/styles.dart';
import 'package:homesta/core/widgets/custom_button_widget.dart';
import 'package:homesta/features/payment/presentation/widgets/credit_card_form_section.dart';

class CardFormWidget extends StatefulWidget {
  const CardFormWidget({super.key});

  @override
  State<CardFormWidget> createState() => _CardFormWidgetState();
}

class _CardFormWidgetState extends State<CardFormWidget> {
  bool saveCard = false;
  final TextEditingController cardHolderController = TextEditingController();
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController expiryDateController = TextEditingController();
  final TextEditingController cvvController = TextEditingController();

  @override
  void dispose() {
    cardHolderController.dispose();
    cardNumberController.dispose();
    expiryDateController.dispose();
    cvvController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorManager.soLightGreyColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(15.r),
          bottomRight: Radius.circular(15.r),
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.h),
            child: CreditCardFormSection(
              cardHolderController: cardHolderController,
              cardNumberController: cardNumberController,
              expiryDateController: expiryDateController,
              cvvController: cvvController,
            ),
          ),
          SizedBox(height: 16.h),
          Row(
            children: [
              Checkbox(
                activeColor: ColorManager.primaryColor,
                value: saveCard,
                onChanged: (bool? value) {
                  if (value != null) {
                    setState(() {
                      saveCard = value;
                    });
                  }
                },
              ),
              Text(
                'Save card for future payments',
                style: TextStyles.font14GreyColorW400,
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: CustomButtonWidget(buttonText: 'Add Card', onPressed: () {}),
          ),
          SizedBox(height: 16.h),
        ],
      ),
    );
  }
}
