import 'package:dartz/dartz.dart';
import 'package:homesta/core/error/error_model.dart';
import 'package:homesta/core/error/expections.dart';
import 'package:homesta/features/product/data/data_sources/remote_data_source/product_data_source.dart';
import 'package:homesta/features/product/domain/entities/product_entitty.dart';
import 'package:homesta/features/product/domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductDataSource productDataSource;

  ProductRepositoryImpl({required this.productDataSource});
  @override
  Future<Either<ErrorModel, List<ProductEntity>>> getAllProducts()async {
try {
final List<ProductEntity> products=  await productDataSource.getProducts();
return right(products);

} on ServerException catch (e) {
return left(e.errModel);
}
  }
}