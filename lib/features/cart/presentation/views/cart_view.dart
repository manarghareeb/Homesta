import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/core/di/service_locator.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/widgets/custom_button_widget.dart';
import 'package:homesta/core/widgets/custom_confirm_dialog.dart';
import 'package:homesta/features/cart/presentation/cubit/cart_cubit/cart_cubit.dart';
import 'package:homesta/features/cart/presentation/cubit/cart_cubit/cart_state.dart';
import 'package:homesta/features/cart/presentation/widgets/cart_item_widget.dart';
import 'package:homesta/features/order/presentation/widgets/order_summary_in_checkout.dart';
import 'package:homesta/features/product/presentation/cubits/get_product_images_cubit.dart/get_product_images_cubit.dart';

class CartView extends StatefulWidget {
  final VoidCallback onNext;
  final String? buttonText;
  const CartView({super.key, required this.onNext, this.buttonText});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  int selectedQuantity = 1;

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
                  padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 8.w),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: cartItems.length,
                  separatorBuilder:
                      (context, index) => SizedBox(height: 24.h),
                          //Divider(color: ColorManager.lightGreyColor),
                  itemBuilder: (context, index) {
                    final cartItem = cartItems[index];
                    return BlocProvider(
                     create: (context) => sl<GetProductImagesCubit>()..getProductImages(cartItem.productId??0),
                      child: CartItemWidget(
                        id: cartItem.productId ?? 0,
                              onPressedDeleted: () async {
                                final confirm = await showCustomConfirmDialog(
                                  context: context,
                                  title: 'Remove Item',
                                  content:
                                      'Are you sure you want to remove ${cartItem.productName}?',
                                );
                      
                                if (confirm == true) {
                                  await context
                                      .read<CartCubit>()
                                      .removeItemFromCart(cartItem.cartItemId!);
                                }
                              },
                      
                              name: cartItem.productName ?? 'Unknown Product',
                              color: cartItem.productColor ?? '',
                              image: 'assets/images/chair.png',
                              price: cartItem.unitPrice ?? 0,
                              quantity: cartItem.quantity ?? 1,
                            ),
                    );
                    /*return YourCardItem(
                      image: 'assets/images/image 1.png',
                      name: cartItem.productName ?? '',
                      color: cartItem.productColor ?? '',
                      price: cartItem.unitPrice ?? 0,
                      //quantity: cartItem.quantity ?? 0,
                      onQuantityChanged: (value) {
                        setState(() {
                          selectedQuantity = value;
                        });
                      },
                      onPressedDelete: () async {
                        final confirm = await showCustomConfirmDialog(
                          context: context,
                          title: 'Remove Item',
                          content:
                              'Are you sure you want to remove ${cartItem.productName}?',
                        );

                        if (confirm == true) {
                          await context.read<CartCubit>().removeItemFromCart(
                            cartItem.cartItemId!,
                          );
                        }
                      },
                    );*/
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
                        buttonText: widget.buttonText ?? 'Continue to Shipping',
                        onPressed: widget.onNext,
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
