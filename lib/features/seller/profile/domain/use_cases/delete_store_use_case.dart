import 'package:dartz/dartz.dart';

import '../../../../../core/error/error_model.dart';
import '../repo/store_repo.dart';

class DeleteStoreUseCase {
  final StoreRepo storeRepo;
  DeleteStoreUseCase(this.storeRepo);

  Future<Either<ErrorModel, Unit>> call(int id) async {
    return await storeRepo.deleteStore(id);
  }
}
