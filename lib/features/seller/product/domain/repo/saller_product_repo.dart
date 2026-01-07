import 'package:dartz/dartz.dart';
import 'package:homesta/core/error/error_model.dart';
import 'package:homesta/features/seller/product/domain/entitiy/params/add_product_params.dart';

abstract class SallerProductRepo {
  Future<Either<ErrorModel, Unit>> addProduct(AddProductParams product);
}