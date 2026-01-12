import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homesta/features/cart/domain/repos/cart_repo.dart';
import 'package:homesta/features/cart/presentation/cubit/add_item_to_cart_cubit/add_item_to_cart_state.dart';

class AddItemToCartCubit extends Cubit<AddItemToCartState> {
  final CartRepo cartRepo;

  AddItemToCartCubit(this.cartRepo) : super(AddItemToCartInitial());

  Future<void> addItemToCart({
    required int productId,
   required int quantity ,
    required String colorId ,
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
