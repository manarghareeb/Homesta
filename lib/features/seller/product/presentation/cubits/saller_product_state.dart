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

class SellerGetProductLoading extends SellerProductState {}

class SellerGetProductSuccess extends SellerProductState {
final List<ProductEntity> products;

  SellerGetProductSuccess(this.products);
}

class SellerGetProductError extends SellerProductState {
  final String message;

  SellerGetProductError(this.message);
}
