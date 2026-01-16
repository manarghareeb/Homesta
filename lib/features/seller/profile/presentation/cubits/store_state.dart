import 'package:homesta/features/seller/profile/domain/entites/store_entiy.dart';

abstract class StoreState {}

class StoreInitial extends StoreState {}

class StoreLoading extends StoreState {}

class StoreSuccess extends StoreState {
  final StoreEntity storeEntity;
  StoreSuccess(this.storeEntity);
}

class StoresSuccess extends StoreState {
  final List<StoreEntity> stores;
  StoresSuccess(this.stores);
}

class StoreError extends StoreState {
  final String message;
  StoreError(this.message);
}

class GetStoreLoading extends StoreState {}

class GetStoreSuccess extends StoreState {
  final StoreEntity storeEntity;
  GetStoreSuccess(this.storeEntity);
}

class StoreDeletedSuccess extends StoreState {}

class GetStoreError extends StoreState {
  final String message;
  GetStoreError(this.message);
}

