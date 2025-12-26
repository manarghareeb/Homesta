import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/theming/styles.dart';
import 'package:homesta/core/widgets/custom_app_bar_widget.dart';

class EmptyCartScreen extends StatelessWidget {
  const EmptyCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBarWidget(
        text: 'Cart',
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 60.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.shopping_cart_outlined,
                size: 100.sp,
                color: ColorManager.greyColor,
              ),
              SizedBox(height: 16.h),
              Text(
                "Ohhh... Your cart is empty",
                style: TextStyles.font16BlackW500,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 8.h),
              RichText(
                text: TextSpan(
                  text: "You can ",
                  style: TextStyles.font16GreyRegular.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                  children: [
                    TextSpan(
                      text: "shop by category",
                      style: TextStyles.font16PrimaryColorW400Underline.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
