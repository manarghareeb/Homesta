import 'package:equatable/equatable.dart';
import 'package:homesta/features/order/data/models/user_orders_response.dart';

abstract class UserOrdersState extends Equatable {
  const UserOrdersState();

  @override
  List<Object> get props => [];
}

class UserOrdersInitial extends UserOrdersState {}

class UserOrdersLoading extends UserOrdersState {}

class UserOrdersLoaded extends UserOrdersState {
  final List<UserOrdersResponse> orders;

  const UserOrdersLoaded(this.orders);

  @override
  List<Object> get props => [orders];
}

class UserOrdersError extends UserOrdersState {
  final String message;

  const UserOrdersError(this.message);

  @override
  List<Object> get props => [message];
}
