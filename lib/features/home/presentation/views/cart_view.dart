import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/widgets/custom_button_widget.dart';
import 'package:homesta/features/home/presentation/widgets/order_summary_in_checkout.dart';
import 'package:homesta/features/home/presentation/widgets/your_card_item.dart';

class CartView extends StatelessWidget {
  final VoidCallback onNext;
  const CartView({super.key, required this.onNext});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 4,
            separatorBuilder:
                (context, index) => Divider(color: ColorManager.lightGreyColor),
            itemBuilder: (context, index) {
              return YourCardItem();
            },
          ),
          SizedBox(height: 24.h),
          Container(
            padding: EdgeInsets.all(24.h),
            decoration: BoxDecoration(
              color: ColorManager.aliceBlue,
              borderRadius: BorderRadius.circular(15.r),
            ),
            child: Column(
              children: [
                const OrderSummaryInCheckout(),
                SizedBox(height: 24.h,),
                CustomButtonWidget(
                  buttonText: 'Continue to Shipping', 
                  onPressed: onNext
                )
              ],
            )
          ),
        ],
      ),
    );
  }
}
