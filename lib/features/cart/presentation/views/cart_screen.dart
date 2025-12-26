import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/core/widgets/custom_app_bar_widget.dart';
import 'package:homesta/features/cart/presentation/widgets/cart_item_widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBarWidget(
        text: 'Cart',
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(
            horizontal: 16.w,
            vertical: 16.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Text('Order Details', style: TextStyles.font18BlackW500),
              ListView.separated(
                padding: EdgeInsets.symmetric(vertical: 16.h),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 3,
                separatorBuilder: (context, index) => SizedBox(height: 24.h),
                itemBuilder: (context, index) {
                  return CartItemWidget(
                    name: 'Modern Chair',
                    color: 'Green',
                    image: 'assets/images/chair.png',
                    price: 200,
                  );
                },
              ),
              /*const CouponSection(),
              SizedBox(height: 24.h),
              Text('Order Summary', style: TextStyles.font18BlackW500),
              SizedBox(height: 16.h),
              Divider(height: 1, color: ColorManager.lightGreyColor),
              SizedBox(height: 16.h),
              const OrderSummarySection(),
              SizedBox(height: 46.h),
              CustomButtonWidget(
                buttonText: 'Proceed to Checkout',
                onPressed: () {},
              ),*/
            ],
          ),
        ),
      ),
    );
  }
}
