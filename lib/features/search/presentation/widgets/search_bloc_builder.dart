import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:homesta/core/routing/app_router.dart';
import 'package:homesta/core/widgets/custom_cached_network_image.dart';
import 'package:homesta/features/product/presentation/cubits/get_product_images_cubit.dart/get_product_images_cubit.dart';
import 'package:homesta/features/product/presentation/cubits/get_product_images_cubit.dart/get_ptoduct_image_state.dart';
import 'package:homesta/features/search/presentation/views/cubit/cubit/search_cubit.dart';
import 'package:homesta/features/search/presentation/widgets/search_empty_state.dart';
import 'package:homesta/features/seller/product/domain/entitiy/product_image_entity.dart';

class SearchBlocBuilder extends StatelessWidget {
  const SearchBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchInitial) {
          return const SearchEmptyState();
        }
        if (state is SearchLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is SearchSuccess) {
          if (state.results.isEmpty) {
            return Text("No results found ");
          } else {
            return Expanded(
              child: ListView.builder(
                itemCount: state.results.length,
                itemBuilder: (context, index) {
                  final item = state.results[index];
                  return GestureDetector(
                    onTap: () {
                final loadedImages = context.read<GetProductImagesCubit>().state is GetPtoductImageSuccess
          ? (context.read<GetProductImagesCubit>().state as GetPtoductImageSuccess).products
          : <ProductImageEntity>[];
              context.push(AppRouter.productDetailsScreen, extra: {
          'product': item,
          'images': loadedImages,
              },);
                    },
                    child: ListTile(
                      leading: const Icon(Icons.access_time, size: 20),
                      title: Text(item.name),
                      subtitle: Text(item.description),
                    ),
                  );
                },
              ),
            );
          }
        }

        if (state is SearchFailure) {
          return Center(child: Text(state.errorMessage));
        }

        return const SizedBox.shrink();
      },
    );
  }
}
