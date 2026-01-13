import 'package:dartz/dartz.dart';
import 'package:homesta/core/error/error_model.dart';
import 'package:homesta/core/error/expections.dart';
import 'package:homesta/features/product/data/models/product_model.dart';
import 'package:homesta/features/product/domain/entities/product_entitty.dart';
import 'package:homesta/features/seller/product/data/data_source/saller_product_data_source.dart';
import 'package:homesta/features/seller/product/domain/entitiy/params/add_product_params.dart';
import 'package:homesta/features/seller/product/domain/repo/saller_product_repo.dart';

class SallerProductRepoImpl implements SallerProductRepo{
  final SallerProductDataSource sallerProductDataSource;
  SallerProductRepoImpl({required this.sallerProductDataSource});
  @override
  Future<Either<ErrorModel, ProductEntity>> addProduct(AddProductParams product)async {
    try{
   final  productModel=   await sallerProductDataSource.addProduct(product);
      return  Right(productModel);
    }on ServerException catch(e){
      return Left(e.errModel);
    }

  }

  @override
  Future<Either<ErrorModel, Unit>> deleteProduct(int productId)async {
    try{
      await sallerProductDataSource.deleteProduct(productId);
      return const Right(unit);
    }on ServerException catch(e){
      return Left(e.errModel);
    }
  }

  @override
  Future<Either<ErrorModel, List<ProductEntity>>> getSellerProducts(int id)async {
    try{
      final List<ProductModel> products= await sallerProductDataSource.getSellerProducts(id);
      return Right(products);
    }on ServerException catch(e){
      return Left(e.errModel);
    }
  }

  @override
  Future<Either<ErrorModel, Unit>> updateProduct(AddProductParams product) {
    // TODO: implement updateProduct
    throw UnimplementedError();
  }

}