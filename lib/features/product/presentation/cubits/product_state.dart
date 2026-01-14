import 'package:homesta/features/product/domain/entities/product_entitty.dart';
import 'package:homesta/features/seller/product/domain/entitiy/product_image_entity.dart';

abstract class ProductState {}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductSuccess extends ProductState {
  final List<ProductEntity> products;

  ProductSuccess(this.products);
}

class ProductFailure extends ProductState {
  final String message;

  ProductFailure(this.message);
}
