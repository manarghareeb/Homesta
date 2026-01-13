import 'package:dartz/dartz.dart';
import 'package:homesta/core/error/error_model.dart';
import 'package:homesta/features/product/domain/entities/product_entitty.dart';
import 'package:homesta/features/seller/product/domain/entitiy/params/add_product_params.dart';
import 'package:homesta/features/seller/product/domain/repo/saller_product_repo.dart';

class AddProductUseCase {
  final SallerProductRepo sallerProductRepo;
  AddProductUseCase({required this.sallerProductRepo});
  Future<Either<ErrorModel, ProductEntity>>call(AddProductParams params) async {
    return await sallerProductRepo.addProduct(params);
  }
}