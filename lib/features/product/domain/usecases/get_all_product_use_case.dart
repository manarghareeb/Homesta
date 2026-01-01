import 'package:dartz/dartz.dart';
import 'package:homesta/core/error/error_model.dart';
import 'package:homesta/features/product/domain/entities/product_entitty.dart';
import 'package:homesta/features/product/domain/repositories/product_repository.dart';

class GetAllProductUseCase {
  final ProductRepository productRepository;

  GetAllProductUseCase({required this.productRepository});

  Future<Either<ErrorModel,List<ProductEntity>>> call(){
    return productRepository.getAllProducts();
  }
}