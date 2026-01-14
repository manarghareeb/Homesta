import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/features/order/data/models/user_orders_response.dart';
import 'package:homesta/features/order/presentation/cubit/order_details_cubit/order_details_cubit.dart';
import 'package:homesta/features/order/presentation/cubit/order_details_cubit/order_details_state.dart';
import 'package:homesta/features/order/presentation/widgets/order_details_section.dart';
import 'package:homesta/features/order/presentation/widgets/order_header_section.dart';

class OrderCard extends StatefulWidget {
  final UserOrdersResponse order;

  const OrderCard({super.key, required this.order});

  @override
  State<OrderCard> createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard> {
  bool showDetails = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
        border: Border.all(color: ColorManager.lightGreyColor, width: 0.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          OrderHeaderSection(
            order: widget.order,
            showDetails: showDetails,
            onToggleDetails: () async {
              if (!showDetails) {
                await context
                    .read<TrackOrderDetailsCubit>()
                    .fetchOrder(widget.order.orderId);
              }
              setState(() => showDetails = !showDetails);
            },
          ),
          /*AnimatedSwitcher(
            duration: const Duration(milliseconds: 400),
            switchInCurve: Curves.easeOut,
            switchOutCurve: Curves.easeIn,
            child: showDetails
                ? OrderDetailsSection(
                    orderId: widget.order.orderId,
                    orderStatus: widget.order.status,
                    order: widget.order,
                  )
                : const SizedBox(),
          ),*/
          AnimatedSwitcher(
  duration: const Duration(milliseconds: 400),
  switchInCurve: Curves.easeOut,
  switchOutCurve: Curves.easeIn,
  child: showDetails
      ? BlocBuilder<TrackOrderDetailsCubit, TrackOrderDetailsState>(
          builder: (context, state) {
            if (state is TrackOrderDetailsLoaded) {
              return OrderDetailsSection(
                orderId: widget.order.orderId,
                orderStatus: widget.order.status,
                order: state.order,
              );
            } else if (state is TrackOrderDetailsLoading) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return const SizedBox();
            }
          },
        )
      : const SizedBox(),
),

        ],
      ),
    );
  }
}
