
import 'package:homesta/features/seller/product/domain/entitiy/product_image_entity.dart';

abstract class ProductImageState {}
class ProductImageInitial extends ProductImageState {}
class ProductImageLoading extends ProductImageState {}
class ProductImageSuccess extends ProductImageState {
  final List<ProductImageEntity> images;
  ProductImageSuccess(this.images);
}
class ProductImageError extends ProductImageState {
  final String message;
  ProductImageError(this.message);
}