import 'package:homesta/features/product/domain/entities/product_entitty.dart';

abstract class SellerProductState {}

class SellerProductInitial extends SellerProductState {}

class SellerAddProductLoading extends SellerProductState {}

class SellerAddProductSuccess extends SellerProductState {

}

class SellerAddProductError extends SellerProductState {
  final String message;

  SellerAddProductError(this.message);
}
