import 'package:homesta/core/api/api_consumer.dart';
import 'package:homesta/core/api/end_ponits.dart';
import 'package:homesta/features/product/data/models/product_model.dart';

abstract class ProductDataSource {
  Future<List<ProductModel>> getProducts();
}

class ProductDataSourceImp implements ProductDataSource {
  final ApiConsumer api;

  ProductDataSourceImp({required this.api});
  @override
  Future<List<ProductModel>> getProducts() async {
    List<ProductModel> products = [];

    final response = await api.get(EndPoint.getAllProducts);
    for (var product in response) {
      products.add(ProductModel.fromJson(product));
    }
    return products;
  }
}
