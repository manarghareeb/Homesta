import 'package:dartz/dartz.dart';
import '../../../../../core/error/error_model.dart';
import '../../data/models/all_store_response_model.dart';
import '../repo/store_repo.dart';

class GetAllStoresUseCase {
  final StoreRepo storeRepo;

  GetAllStoresUseCase(this.storeRepo);

  Future<Either<ErrorModel, List<SimpleStoreModel>>> call() async {
    return await storeRepo.getAllStores();
  }
}
