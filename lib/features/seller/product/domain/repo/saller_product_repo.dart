import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:homesta/core/error/error_model.dart';
import 'package:homesta/features/product/domain/entities/product_entitty.dart';
import 'package:homesta/features/seller/product/domain/entitiy/params/add_product_params.dart';
import 'package:homesta/features/seller/product/domain/entitiy/product_image_entity.dart';

abstract class SallerProductRepo {
  Future<Either<ErrorModel, ProductEntity>> addProduct(AddProductParams product);
  Future<Either<ErrorModel, List<ProductEntity>>> getSellerProducts(int id);
  Future<Either<ErrorModel, Unit>> updateProduct(AddProductParams product);
  Future<Either<ErrorModel, Unit>> deleteProduct(int productId);
  Future<Either<ErrorModel, List<ProductImageEntity>>> uploadProuductImage({required int productId,required List<File> images});
}