import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:homesta/core/di/service_locator.dart';
import 'package:homesta/core/routing/app_router.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/theming/styles.dart';
import 'package:homesta/core/widgets/custom_confirm_dialog.dart';
import 'package:homesta/features/cart/presentation/cubit/cart_cubit/cart_cubit.dart';
import 'package:homesta/features/cart/presentation/cubit/cart_cubit/cart_state.dart';
import 'package:homesta/features/cart/presentation/views/empty_cart_screen.dart';
import 'package:homesta/features/cart/presentation/widgets/cart_item_widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<CartCubit>()..getCartItems(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: Text(''),
          title: Text('Cart', style: TextStyles.font24BlackColorW500),
          centerTitle: true,
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
        ),
        body: BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            if (state is CartLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is CartFailure) {
              return Center(child: Text(state.error));
            } else if (state is CartSuccess) {
              final cartItems = state.cart.cartItems ?? [];
              if (cartItems.isEmpty) {
                return const EmptyCartScreen();
              }
              return SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 16.h,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () async {
                          final confirm = await showCustomConfirmDialog(
                            context: context,
                            title: 'Clear Cart',
                            content: 'Are you sure you want to clear the cart?',
                          );

                          if (confirm == true) {
                            await context.read<CartCubit>().clearCart();
                          }
                        },
                        child: Text(
                          'Clear All Cart',
                          style: TextStyles.font16PrimaryColorW400Underline,
                        ),
                      ),

                      ListView.separated(
                        padding: EdgeInsets.symmetric(vertical: 16.h),
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: cartItems.length,
                        separatorBuilder:
                            (context, index) => SizedBox(height: 24.h),
                        itemBuilder: (context, index) {
                          final cartItem = cartItems[index];
                          return CartItemWidget(
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
                          );
                        },
                      ),
                      SizedBox(height: 16.h),
                    ],
                  ),
                ),
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
        bottomNavigationBar: BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            if (state is CartSuccess &&
                (state.cart.cartItems?.isNotEmpty ?? false)) {
              final totalPrice = state.cart.totalPrice ?? 0;
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                child: Row(
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('Total Price', style: TextStyles.font16BlackW500),
                        Text(
                          '\$$totalPrice',
                          style: TextStyles.font16BlackW500.copyWith(
                            color: ColorManager.thirdColor,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 64.w),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          GoRouter.of(context).push(AppRouter.orderFlowScreen);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorManager.primaryColor,
                          padding: EdgeInsets.symmetric(vertical: 14.h),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.r),
                          ),
                        ),
                        child: Text(
                          'Checkout',
                          textAlign: TextAlign.center,
                          style: TextStyles.font16WhiteW500,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
