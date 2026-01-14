import 'package:dartz/dartz.dart';
import 'package:homesta/core/error/error_model.dart';
import 'package:homesta/features/product/domain/repositories/product_repository.dart';
import 'package:homesta/features/seller/product/domain/entitiy/product_image_entity.dart';

class GetProductImagesUseCase {
  final ProductRepository productRepository;
  GetProductImagesUseCase(this.productRepository);
  Future<Either<ErrorModel, List<ProductImageEntity>>> call(int productId) => productRepository.getProductImage(productId);
}