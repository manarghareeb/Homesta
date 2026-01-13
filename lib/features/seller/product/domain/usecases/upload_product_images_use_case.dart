import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:homesta/core/error/error_model.dart';
import 'package:homesta/features/seller/product/domain/entitiy/product_image_entity.dart';
import 'package:homesta/features/seller/product/domain/repo/saller_product_repo.dart';

class UploadProductImagesUseCase {
  final SallerProductRepo sallerProductRepo;
  UploadProductImagesUseCase(this.sallerProductRepo);

  Future<Either<ErrorModel, List<ProductImageEntity>>> call({required int productId,required List<File> images}) async {
    return await sallerProductRepo.uploadProuductImage(productId: productId,images:  images);
  }
}