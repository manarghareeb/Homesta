import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homesta/features/order/domain/repos/order_repo.dart';
import 'package:homesta/features/order/presentation/cubit/order_details_cubit/order_details_state.dart';

class TrackOrderDetailsCubit extends Cubit<TrackOrderDetailsState> {
  final OrderRepo repository;
  TrackOrderDetailsCubit(this.repository) : super(TrackOrderDetailsInitial());

  Future<void> fetchOrder(int orderId) async {
    emit(TrackOrderDetailsLoading());
    final result = await repository.getOrderDetails(orderId);
    result.fold(
      (failure) {
        emit(TrackOrderDetailsError(failure.errorMessage));
      },
      (order) {
        emit(TrackOrderDetailsLoaded(order));
      },
    );
  }
}
