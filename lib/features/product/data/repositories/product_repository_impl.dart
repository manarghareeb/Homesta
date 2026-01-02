import 'package:dartz/dartz.dart';
import 'package:homesta/core/error/error_model.dart';
import 'package:homesta/core/error/expections.dart';
import 'package:homesta/features/product/data/data_sources/remote_data_source/product_data_source.dart';
import 'package:homesta/features/product/data/data_sources/remote_data_source/review_data_source.dart';
import 'package:homesta/features/product/domain/entities/product_entitty.dart';
import 'package:homesta/features/product/domain/entities/review_entity.dart';
import 'package:homesta/features/product/domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductDataSource productDataSource;
final ReviewProductDataSource reviewDataSource;
  ProductRepositoryImpl({required this.productDataSource, required this.reviewDataSource});
  @override
  Future<Either<ErrorModel, List<ProductEntity>>> getAllProducts()async {
try {
final List<ProductEntity> products=  await productDataSource.getProducts();
return right(products);

} on ServerException catch (e) {
return left(e.errModel);
}
  
}

  @override
  Future<Either<ErrorModel, List<ReviewEntity>>> getAllProductReviews(int productId) async{
    try{
final List<ReviewEntity> reviews=  await reviewDataSource.getProductReviews(productId);
return right(reviews);

} on ServerException catch (e) {
return left(e.errModel);

}}
}