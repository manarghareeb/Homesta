
import 'package:homesta/core/api/api_consumer.dart';
import 'package:homesta/core/api/end_ponits.dart';
import 'package:homesta/features/seller/profile/domain/entites/params/create_store_params.dart';

abstract class StoreDataSource {
Future<void> createStore(CreateStoreParams params);


}

class StoreDataSourceImpl implements StoreDataSource {
  final ApiConsumer apiConsumer;
  StoreDataSourceImpl({required this.apiConsumer});
  @override
  Future<void> createStore(CreateStoreParams params)async {
await apiConsumer.post(EndPoint.createStore,data: params.toJson());

  }
  
}