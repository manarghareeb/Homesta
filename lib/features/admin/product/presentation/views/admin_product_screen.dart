import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/widgets/custom_app_bar_widget.dart';
import 'package:homesta/features/admin/product/presentation/views/product_cart_admin.dart';
import '../../../../product/presentation/cubits/product_cubit.dart';
import '../../../../product/presentation/cubits/product_state.dart';

class AdminProductScreen extends StatelessWidget {
  const AdminProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.soLightGreyColor,
      appBar: CustomAppBarWidget(
        text: 'Products',
        backgroundColor: ColorManager.soLightGreyColor,
      ),
      body: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          if (state is ProductLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ProductSuccess) {
            return MasonryGridView.count(
              padding: const EdgeInsets.all(16),
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              itemCount: state.products.length,
              itemBuilder: (context, index) {
                return ProductCardAdmin(product: state.products[index]);
              },
            );
          } else if (state is ProductFailure) {
            return Center(child: Text(state.message));
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
