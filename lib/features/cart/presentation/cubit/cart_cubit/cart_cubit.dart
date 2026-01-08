import 'package:flutter_bloc/flutter_bloc.dart';
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
}
