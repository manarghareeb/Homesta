import 'package:homesta/core/api/api_consumer.dart';
import 'package:homesta/core/api/end_ponits.dart';
import 'package:homesta/features/product/data/models/product_model.dart';
import 'package:homesta/features/seller/product/data/models/product_imges_model.dart';

abstract class ProductDataSource {
  Future<List<ProductModel>> getProducts();
  Future<List<ProductImageModel>> getProductImages(int productId);
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
  
  @override
  Future<List<ProductImageModel>> getProductImages(int productId) async {
   List<ProductImageModel> productImages = [];

    final response = await api.get("${EndPoint.getProductImages}/$productId");
   final imagesJson = response['images'] as List<dynamic>? ?? [];

   productImages = imagesJson
      .map((json) => ProductImageModel.fromJson(json))
      .toList();

  return productImages;
  
  }
}
