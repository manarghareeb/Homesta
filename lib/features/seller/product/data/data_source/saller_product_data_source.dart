import 'package:homesta/core/api/api_consumer.dart';
import 'package:homesta/core/api/end_ponits.dart';
import 'package:homesta/features/product/data/models/product_model.dart';
import 'package:homesta/features/seller/product/data/models/product_seller_model.dart';
import 'package:homesta/features/seller/product/domain/entitiy/params/add_product_params.dart';

abstract class SallerProductDataSource {
 Future<void> addProduct(AddProductParams product);
 Future<void> deleteProduct(int productId);
 Future<void> updateProduct(AddProductParams product);
  Future<List<ProductModel>> getSellerProducts(int id);

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
  
  @override
  Future<void> deleteProduct(int productId) {
    // TODO: implement deleteProduct
    throw UnimplementedError();
  }
  
  @override
  Future<List<ProductModel>> getSellerProducts(int id) async{
    List<ProductModel> products = [];

    final response = await apiConsumer.get("${EndPoint.getSallerProducts}$id/products");
    for (var product in response['products']) {
      products.add(ProductModel.fromJson(product));
    }
    return products;
  
  }
  
  @override
  Future<void> updateProduct(AddProductParams product) {
    // TODO: implement updateProduct
    throw UnimplementedError();
  }
}