import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homesta/features/product/domain/entities/product_entitty.dart';
import 'package:homesta/features/product/domain/usecases/get_all_product_use_case.dart';

import 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final GetAllProductUseCase getAllProductsUseCase;
  List<ProductEntity> allProducts = [];

  ProductCubit(this.getAllProductsUseCase) : super(ProductInitial());

  Future<void> getAllProducts() async {
    if (isClosed) return;
    emit(ProductLoading());

    final result = await getAllProductsUseCase();

    result.fold(
      (failure) {
        //emit(ProductFailure(failure.errorMessage));
        if (!isClosed) emit(ProductFailure(failure.errorMessage));
      },
      (products) {
        allProducts = products;
        //emit(ProductSuccess(products));
        if (!isClosed) emit(ProductSuccess(products));
      },
    );
  }

  void filterProductsByCategories(List<int> categoryIds) {
    if (categoryIds.isEmpty) {
      emit(ProductSuccess(allProducts));
      return;
    }
    //final filtered =
    //  allProducts.where((p) => categoryIds.contains(p.categoryId)).toList();
    final filtered =
        allProducts.where((p) {
          return categoryIds.contains(p.categoryId) ||
              categoryIds.contains(p.subCategoryId);
        }).toList();
    emit(ProductSuccess(filtered));
  }

  void getProductsByCategories(List<int> categoryIds) {
    final allProducts =
        state is ProductSuccess
            ? (state as ProductSuccess).products.cast<ProductEntity>()
            : <ProductEntity>[];

    final filtered =
        allProducts.where((p) => categoryIds.contains(p.categoryId)).toList();

    emit(ProductSuccess(filtered));
  }

  void filterByPrice(double start, double end) async {
    emit(ProductLoading());

    final result = await getAllProductsUseCase();

    result.fold((error) => emit(ProductFailure(error.errorMessage)), (
      products,
    ) {
      final filtered =
          products.where((p) => p.price >= start && p.price <= end).toList();

      emit(ProductSuccess(filtered));
    });
  }

  void filterByAvailability({
    required bool inStock,
    required bool outOfStock,
  }) {
    if (state is! ProductSuccess) return;

    final currentProducts =
        (state as ProductSuccess).products.cast<ProductEntity>();

    final filtered = currentProducts.where((p) {
      if (inStock && p.quantity > 0) return true;
      if (outOfStock && p.quantity == 0) return true;
      return false;
    }).toList();

    emit(ProductSuccess(filtered));
  }

  void applyFilters({
    List<int>? categoryIds,
    double? startPrice,
    double? endPrice,
    bool? inStock,
    bool? outOfStock,
  }) {
    var filtered = List<ProductEntity>.from(allProducts);

    if (categoryIds != null && categoryIds.isNotEmpty) {
      filtered = filtered.where((p) {
        return categoryIds.contains(p.categoryId) ||
            categoryIds.contains(p.subCategoryId);
      }).toList();
    }

    if (startPrice != null && endPrice != null) {
      filtered = filtered
          .where((p) => p.price >= startPrice && p.price <= endPrice)
          .toList();
    }

    if (inStock != null || outOfStock != null) {
      filtered = filtered.where((p) {
        if (inStock == true && p.quantity > 0) return true;
        if (outOfStock == true && p.quantity == 0) return true;
        return false;
      }).toList();
    }

    emit(ProductSuccess(filtered));
  }
}
