import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homesta/features/cart/data/models/cart_model/cart_item.dart';
import 'package:homesta/features/cart/domain/repos/cart_repo.dart';
import 'package:homesta/features/cart/presentation/cubit/cart_cubit/cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit(this.cartRepo) : super(CartInitial());
  final CartRepo cartRepo;

  Future<void> getCartItems() async {
    emit(CartLoading());
    try {
      final cart = await cartRepo.getCart();
      emit(CartSuccess(cart));
    } catch (e) {
      emit(CartFailure(e.toString()));
    }
  }

  /*Future<void> clearCart() async {
    emit(CartLoading());
    try {
      await cartRepo.clearCart();
      emit(CartCleared()); 
    } catch (e) {
      emit(CartFailure(e.toString()));
    }
  }

  Future<void> removeItemFromCart(int itemId) async {
    emit(CartLoading());
    try {
      await cartRepo.removeItemFromCart(itemId);
      final cart = await cartRepo.getCart(); 
      emit(CartSuccess(cart));
    } catch (e) {
      emit(CartFailure(e.toString()));
    }
  }*/
  /*Future<void> clearCart() async {
    try {
      await cartRepo.clearCart();
      if (state is CartSuccess) {
        final currentState = state as CartSuccess;
        emit(CartSuccess(currentState.cart.copyWith(cartItems: [])));
      }
    } catch (e) {
      emit(CartFailure(e.toString()));
    }
  }*/
  Future<void> clearCart() async {
  try {
    await cartRepo.clearCart();
    if (state is CartSuccess) {
      final currentState = state as CartSuccess;
      emit(CartSuccess(
        currentState.cart.copyWith(
          cartItems: [],
          totalItems: 0,
          totalPrice: 0,
        ),
      ));
    }
  } catch (e) {
    emit(CartFailure(e.toString()));
  }
}


  Future<void> removeItemFromCart(int itemId) async {
  try {
    await cartRepo.removeItemFromCart(itemId);
    if (state is CartSuccess) {
      final currentState = state as CartSuccess;
      final updatedItems = List<CartItem>.from(currentState.cart.cartItems!);
      updatedItems.removeWhere((item) => item.cartItemId == itemId);

      final updatedTotalPrice = updatedItems.fold<double>(
        0,
        (sum, item) => sum + (item.unitPrice ?? 0),
      );

      emit(CartSuccess(
        currentState.cart.copyWith(
          cartItems: updatedItems,
          totalItems: updatedItems.length,
          totalPrice: updatedTotalPrice,
        ),
      ));
    }
  } catch (e) {
    emit(CartFailure(e.toString()));
  }
}

}
