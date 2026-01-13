
import 'package:homesta/core/api/api_consumer.dart';
import 'package:homesta/core/api/end_ponits.dart';
import 'package:homesta/features/seller/profile/data/models/store_model.dart';
import 'package:homesta/features/seller/profile/domain/entites/params/create_store_params.dart';

abstract class StoreDataSource {
Future<StoreModel> createStore(CreateStoreParams params);
Future<StoreModel> getStore(int id);


}

class StoreDataSourceImpl implements StoreDataSource {
  final ApiConsumer apiConsumer;
  StoreDataSourceImpl({required this.apiConsumer});
  @override
  Future<StoreModel> createStore(CreateStoreParams params)async {
final res= await apiConsumer.post(EndPoint.createStore,data: params.toJson());
return StoreModel.fromJson(res);

  }
  
  @override
  Future<StoreModel> getStore(int id)async {
    
final res= await apiConsumer.get("${EndPoint.getStore}/$id/products");

return StoreModel.fromJson(res);
  }
  
}