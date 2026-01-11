import 'package:dartz/dartz.dart';
import 'package:homesta/core/error/error_model.dart';
import 'package:homesta/features/seller/product/domain/repo/saller_product_repo.dart';

class DeletProductUseCase {
  final SallerProductRepo repo;
  DeletProductUseCase(this.repo);
  Future<Either<ErrorModel, Unit>> call(int productId) async {
    return await repo.deleteProduct(productId);
  }
}