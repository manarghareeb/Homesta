import 'package:homesta/features/seller/product/domain/entitiy/product_image_entity.dart';

class GetPtoductImagesState {}

class GetProductImageInitial extends GetPtoductImagesState {}
class GetProductImageLoading extends GetPtoductImagesState {}

class GetPtoductImageSuccess extends GetPtoductImagesState {
  final List<ProductImageEntity> products;

  GetPtoductImageSuccess(this.products);
}

class GetProductImageFailure extends GetPtoductImagesState {
  final String message;

  GetProductImageFailure(this.message);
}
