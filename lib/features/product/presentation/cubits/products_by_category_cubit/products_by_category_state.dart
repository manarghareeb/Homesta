import 'package:homesta/features/product/domain/entities/product_entitty.dart';

abstract class ProductsByCategoryState {}

class ProductsByCategoryInitial extends ProductsByCategoryState{}
class ProductsByCategoryLoading extends ProductsByCategoryState{}
class ProductsByCategorySuccess extends ProductsByCategoryState{
  final List<ProductEntity> products;

  ProductsByCategorySuccess(this.products);
}
class ProductsByCategoryFailure extends ProductsByCategoryState{
  final String message;

  ProductsByCategoryFailure(this.message);
}