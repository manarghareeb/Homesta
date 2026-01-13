import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/theming/styles.dart';
import 'package:homesta/features/order/presentation/cubit/order_details_cubit/order_details_cubit.dart';
import 'package:homesta/features/order/presentation/cubit/order_details_cubit/order_details_state.dart';
import 'package:homesta/features/order/presentation/widgets/order_actions_section.dart';
import 'package:homesta/features/order/presentation/widgets/order_item_widget.dart';

class OrderDetailsSection extends StatelessWidget {
  final int orderId;
  final String orderStatus;

  const OrderDetailsSection({
    super.key,
    required this.orderId,
    required this.orderStatus,
  });

  List<String> buildActions(String status) {
    if (status == "Pending" || status == "Processing" || status == "Shipped") {
      return ["Track Order", "Invoice", "Cancel Order"];
    } else if (status == "Delivered") {
      return ["Track Order", "Invoice"];
    } else {
      return ["Track Order"];
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrackOrderDetailsCubit, TrackOrderDetailsState>(
      key: ValueKey(orderId),
      builder: (context, state) {
        if (state is TrackOrderDetailsLoading) {
          return const Center(
            child: Padding(
              padding: EdgeInsets.all(12.0),
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is TrackOrderDetailsLoaded) {
          final items = state.order.items;
          final actions = buildActions(orderStatus);

          return Column(
            children: [
              SizedBox(height: 16.h),
              ...items.map((item) => Padding(
                    padding: EdgeInsets.symmetric(vertical: 4.h),
                    child: OrderItemWidget(item: item),
                  )),
              SizedBox(height: 16.h),
              Divider(height: 24.h, color: ColorManager.lightGreyColor),
              OrderActionsSection(actions: actions),
            ],
          );
        } else if (state is TrackOrderDetailsError) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 8.h),
            child: Text(
              'Failed to load order items',
              style: TextStyles.font14BlackColorW400.copyWith(
                color: ColorManager.redColor,
              ),
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
