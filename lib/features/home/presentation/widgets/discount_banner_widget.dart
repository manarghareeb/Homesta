import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/widgets/custom_button_widget.dart';

class DiscountBannerWidget extends StatelessWidget {
  final bool dark;
  final String image;

  const DiscountBannerWidget({super.key, this.dark = false, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: dark ? ColorManager.primaryColor : ColorManager.soLightGreyColor,
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Flat 15% Discount',
                  style: TextStyle(
                    color: dark ? ColorManager.greyColor : Colors.grey,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  'Wood Chair\nCollection',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: dark ? Colors.black : Colors.black,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed',
                  style: TextStyle(
                    fontSize: 12,
                    color: dark ? Colors.white70 : Colors.grey,
                  ),
                ),
                SizedBox(height: 12.h),
                CustomButtonWidget(
                  buttonText: 'Shop Now →',
                  onPressed: () {},
                  backgroundColor: ColorManager.thirdColor,
                  textColor: Colors.white,
                  height: 58.h,
                  minWidth: 130.w,
                  raduis: 15,
                ),
              ],
            ),
          ),
          Image.asset(image, height: 120.h),
        ],
      ),
    );
  }
}
