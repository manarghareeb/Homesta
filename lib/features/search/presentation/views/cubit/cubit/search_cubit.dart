import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homesta/features/product/domain/entities/product_entitty.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());
  search(List<ProductEntity> products, String query) {
    emit(SearchLoading());
    List<ProductEntity> results =
        products
            .where(
              (product) => product.name.toLowerCase().contains(
                query.toLowerCase().trim(),
              ),
            )
            .toList();
    emit(SearchSuccess(results));
  }
}
