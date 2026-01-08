import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homesta/features/cart/domain/repos/cart_repo.dart';
import 'package:homesta/features/cart/presentation/cubit/add_item_to_cart_cubit/add_item_to_cart_state.dart';

class AddItemToCartCubit extends Cubit<AddItemToCartState> {
  final CartRepo cartRepo;

  AddItemToCartCubit(this.cartRepo) : super(AddItemToCartInitial());

  Future<void> addItemToCart({
    required int productId,
    int quantity = 1,
    int colorId = 1,
  }) async {
    emit(AddItemToCartLoading());
    try {
      final cartModel = await cartRepo.addItemToCart(
        productId: productId,
        quantity: quantity,
        colorId: colorId,
      );
      emit(AddItemToCartSuccess(cartModel));
    } catch (e) {
      emit(AddItemToCartFailure(e.toString()));
    }
  }
}
