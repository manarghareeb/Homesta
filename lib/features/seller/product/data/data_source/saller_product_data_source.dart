import 'package:homesta/core/api/api_consumer.dart';
import 'package:homesta/core/api/end_ponits.dart';
import 'package:homesta/features/product/data/models/product_model.dart';
import 'package:homesta/features/seller/product/data/models/product_seller_model.dart';
import 'package:homesta/features/seller/product/domain/entitiy/params/add_product_params.dart';

abstract class SallerProductDataSource {
 Future<ProductModel> addProduct(AddProductParams product);
 Future<void> deleteProduct(int productId);
 Future<void> updateProduct(AddProductParams product);
  Future<List<ProductModel>> getSellerProducts(int id);

}

class SallerProductDataSourceImpl implements SallerProductDataSource {
  final ApiConsumer apiConsumer;
  SallerProductDataSourceImpl({required this.apiConsumer});
  @override
  Future<ProductModel> addProduct(AddProductParams product)async {
  final res=await apiConsumer.post(
      EndPoint.addProduct,
      data: product.toJson(),
    );

    return ProductModel.fromJson(res);
  }
  
  @override
  Future<void> deleteProduct(int productId)async {
await apiConsumer.delete("${EndPoint.deleteProduct}$productId");
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