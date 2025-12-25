import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/widgets/custom_button_widget.dart';

class FlashSaleWidget extends StatelessWidget {
  const FlashSaleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(
        color: ColorManager.soLightGreyColor,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        children: [
          /// ================= Image =================
          Container(
            height: 200.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r),
              image: const DecorationImage(
                image: AssetImage('assets/images/chair.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              margin: EdgeInsets.all(10.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.r),
                border: Border.all(color: Colors.white, width: 2),
              ),
            ),
          ),

          SizedBox(height: 16.h),

          /// ================= Title =================
          const Text(
            'Flash sale !',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),

          SizedBox(height: 6.h),

          /// ================= Subtitle =================
          const Text(
            'Get 25% off - Limited Time Offer!',
            style: TextStyle(color: ColorManager.deepGreyColor, fontSize: 16),
          ),

          SizedBox(height: 18.h),

          /// ================= Timer =================
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              _TimeItem(value: '04:', label: 'Days'),
              _TimeItem(value: '14:', label: 'Hours'),
              _TimeItem(value: '48:', label: 'Minutes'),
              _TimeItem(value: '18:', label: 'Seconds'),
            ],
          ),

          SizedBox(height: 22.h),

          CustomButtonWidget(
            buttonText: 'Shop Now →',
            onPressed: () {},
            backgroundColor: ColorManager.primaryColor,
            textColor: Colors.white,
            height: 58.h,
            minWidth: 155,
            raduis: 15,
          ),
        ],
      ),
    );
  }
}

/// ================= Timer Item =================
class _TimeItem extends StatelessWidget {
  final String value;
  final String label;

  const _TimeItem({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 4.h),
        Text(
          label,
          style: const TextStyle(
            fontSize: 18,
            color: ColorManager.primaryColor,
          ),
        ),
      ],
    );
  }
}
