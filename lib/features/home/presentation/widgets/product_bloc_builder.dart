import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homesta/core/di/service_locator.dart';
import 'package:homesta/features/cart/presentation/cubit/add_item_to_cart_cubit/add_item_to_cart_cubit.dart';
import 'package:homesta/features/cart/presentation/cubit/add_item_to_cart_cubit/add_item_to_cart_state.dart';
import 'package:homesta/features/cart/presentation/cubit/cart_cubit/cart_cubit.dart';

import 'package:homesta/features/home/presentation/widgets/product_item.dart';
import 'package:homesta/features/home/presentation/widgets/skeltonizer_grid_view.dart';
import 'package:homesta/features/product/presentation/cubits/get_product_images_cubit.dart/get_product_images_cubit.dart';
import 'package:homesta/features/product/presentation/cubits/product_cubit.dart';
import 'package:homesta/features/product/presentation/cubits/product_state.dart';

class ProductBlocBuilder extends StatelessWidget {
  const ProductBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        if (state is ProductLoading) {
          return const Center(child: SkeletonizerGridView());
        } else if (state is ProductFailure) {
          return Center(child: Text(state.message));
        } else if (state is ProductSuccess) {
          // return   Text("${state.products.length}");
          final products = state.products ?? [];
          if (products.isEmpty) {
            return const Center(child: Text("No products found"));
          }
    
          return BlocListener<AddItemToCartCubit, AddItemToCartState>(
            listener: (context, state) {
              if (state is AddItemToCartSuccess) {
                print('Successss');
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(state.response.message)));
                context.read<CartCubit>().getCartItems();
              } else if (state is AddItemToCartFailure) {
                print('Error: $state.error');
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(state.error)));
              }
            },
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 220,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 0.75,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return ProductItem(productEntity: product);
              },
            ),
          );
        }
    
        return Container(child: Text("something went wrong"));
      },
    );
  }
}
