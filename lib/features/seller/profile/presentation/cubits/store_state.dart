abstract class StoreState {}

class StoreInitial extends StoreState {}

class StoreLoading extends StoreState {}

class StoreSuccess extends StoreState {}

class StoreError extends StoreState {
  final String message;
  StoreError(this.message);
}
