import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/widgets/custom_button_widget.dart';
import 'package:homesta/features/cart/presentation/cubit/cart_cubit/cart_cubit.dart';
import 'package:homesta/features/cart/presentation/cubit/cart_cubit/cart_state.dart';
import 'package:homesta/features/order/presentation/widgets/order_summary_in_checkout.dart';
import 'package:homesta/features/cart/presentation/widgets/your_card_item.dart';

class CartView extends StatelessWidget {
  final VoidCallback onNext;
  final String? buttonText;
  const CartView({super.key, required this.onNext, this.buttonText});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        if (state is CartLoading) {
          return Scaffold(
            body: const Center(child: CircularProgressIndicator()),
          );
        } else if (state is CartFailure) {
          return Center(child: Text(state.error));
        } else if (state is CartSuccess) {
          final cartItems = state.cart.cartItems ?? [];
          return SingleChildScrollView(
            child: Column(
              children: [
                ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: cartItems.length,
                  separatorBuilder:
                      (context, index) =>
                          Divider(color: ColorManager.lightGreyColor),
                  itemBuilder: (context, index) {
                    final cartItem = cartItems[index];
                    return YourCardItem(
                      image: 'assets/images/image 1.png',
                      name: cartItem.productName ?? '',
                      color:
                          (cartItem.productColors != null &&
                                  cartItem.productColors!.isNotEmpty)
                              ? cartItem.productColors!.first
                              : '',
                      price: cartItem.unitPrice ?? 0,
                      //quantity: cartItem.quantity ?? 0,
                      onPressedDelete: () {},
                    );
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
                      OrderSummaryInCheckout(
                        itemsCount: state.cart.cartItems?.length ?? 0,
                        subTotal: state.cart.subTotal ?? 0,
                        shipping: (state.cart.shipping ?? 0).toDouble(),
                        taxes: (state.cart.tax ?? 0).toDouble(),
                        total: state.cart.totalPrice ?? 0,
                      ),
                      SizedBox(height: 24.h),
                      CustomButtonWidget(
                        buttonText: buttonText ?? 'Continue to Shipping',
                        onPressed: onNext,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
        return const Center(child: Text('Not Product in cart'));
      },
    );
  }
}
