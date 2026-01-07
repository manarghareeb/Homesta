import 'package:dartz/dartz.dart';
import 'package:homesta/core/error/error_model.dart';
import 'package:homesta/features/product/domain/entities/product_entitty.dart';
import 'package:homesta/features/seller/product/domain/repo/saller_product_repo.dart';

class GetSallerProductUsecase {
  final SallerProductRepo sallerProductRepo;
  GetSallerProductUsecase({required this.sallerProductRepo});
  Future<Either<ErrorModel, List<ProductEntity>>> call(int id) async {
    return await sallerProductRepo.getSellerProducts(id);
  }
}