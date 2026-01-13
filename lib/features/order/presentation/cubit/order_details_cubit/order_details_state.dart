import 'package:homesta/features/order/data/models/order_details_response/order_details.dart';

abstract class TrackOrderDetailsState {}
class TrackOrderDetailsInitial extends TrackOrderDetailsState {}
class TrackOrderDetailsLoading extends TrackOrderDetailsState {}
class TrackOrderDetailsLoaded extends TrackOrderDetailsState {
  final OrderDetails order;
  TrackOrderDetailsLoaded(this.order);
}
class TrackOrderDetailsError extends TrackOrderDetailsState {
  final String message;
  TrackOrderDetailsError(this.message);
}