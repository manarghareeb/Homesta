import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homesta/features/seller/product/presentation/cubits/saller_product_cubit.dart';
import 'package:homesta/features/seller/product/presentation/cubits/saller_product_state.dart';
import 'package:homesta/features/seller/product/presentation/widgets/product_cart.dart';

class GetProductBlocBuilder extends StatelessWidget {
  const GetProductBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SellerProductCubit, SellerProductState>(
      builder: (context, state) {
        if (state is SellerGetProductLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is SellerGetProductError) {
          return Center(
            child: Text(
              state.message,
              style: const TextStyle(color: Colors.red),
            ),
          );
        }

        if (state is SellerGetProductSuccess) {
          final products = state.products;

          if (products.isEmpty) {
            return const Center(child: Text("لا يوجد منتجات"));
          }

          return GridView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: products.length,
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              childAspectRatio: 0.53,
            ),
            itemBuilder: (context, index) {
              final product = products[index];

              return ProductCard(product: product);
            },
          );
        }

        /// ⚪ Initial
        return const SizedBox.shrink();
      },
    );
  }
}
