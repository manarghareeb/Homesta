import 'package:dartz/dartz.dart';
import 'package:homesta/core/error/error_model.dart';
import 'package:homesta/core/error/expections.dart';
import 'package:homesta/features/seller/product/data/data_source/saller_product_data_source.dart';
import 'package:homesta/features/seller/product/domain/entitiy/params/add_product_params.dart';
import 'package:homesta/features/seller/product/domain/repo/saller_product_repo.dart';

class SallerProductRepoImpl implements SallerProductRepo{
  final SallerProductDataSource sallerProductDataSource;
  SallerProductRepoImpl({required this.sallerProductDataSource});
  @override
  Future<Either<ErrorModel, Unit>> addProduct(AddProductParams product)async {
    try{
      await sallerProductDataSource.addProduct(product);
      return const Right(unit);
    }on ServerException catch(e){
      return Left(e.errModel);
    }

  }

}