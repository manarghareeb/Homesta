import 'package:homesta/core/api/api_consumer.dart';
import 'package:homesta/core/api/end_ponits.dart';
import 'package:homesta/features/seller/product/domain/entitiy/params/add_product_params.dart';

abstract class SallerProductDataSource {
 Future<void> addProduct(AddProductParams product);

}

class SallerProductDataSourceImpl implements SallerProductDataSource {
  final ApiConsumer apiConsumer;
  SallerProductDataSourceImpl({required this.apiConsumer});
  @override
  Future<void> addProduct(AddProductParams product) {
    return apiConsumer.post(
      EndPoint.addProduct,
      data: product.toJson(),
    );
  }
}