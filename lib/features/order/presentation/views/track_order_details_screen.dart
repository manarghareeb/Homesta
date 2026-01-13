import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/theming/styles.dart';
import 'package:homesta/core/widgets/custom_app_bar_widget.dart';
import 'package:homesta/features/order/presentation/cubit/order_details_cubit/order_details_cubit.dart';
import 'package:homesta/features/order/presentation/cubit/order_details_cubit/order_details_state.dart';
import 'package:homesta/features/order/presentation/widgets/order_timeline.dart';

class TrackOrderDetailsScreen extends StatelessWidget {
  final int orderId;
  const TrackOrderDetailsScreen({super.key, required this.orderId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBarWidget(text: 'Track Your Order'),
      body: BlocConsumer<TrackOrderDetailsCubit, TrackOrderDetailsState>(
        listener: (context, state) {
          if (state is TrackOrderDetailsError) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        builder: (context, state) {
          if (state is TrackOrderDetailsLoading ||
              state is TrackOrderDetailsInitial) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is TrackOrderDetailsLoaded) {
            final order = state.order;
            return SingleChildScrollView(
              padding: EdgeInsets.all(16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Order Status', style: TextStyles.font16BlackW500),
                  SizedBox(height: 8.h),
                  Text(
                    'Order ID: #${order.orderId}',
                    style: TextStyles.font16DeepGeyColorRegular,
                  ),
                  SizedBox(height: 16.h),
                  OrderTimeline(
                    currentStatus: order.status,
                    orderDateFormatted: order.orderDateFormatted,
                  ),
                  Text('Products', style: TextStyles.font16BlackW500),
                  SizedBox(height: 16.h),
                  ...order.items.map(
                    (item) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15.r),
                          boxShadow: [
                            BoxShadow(
                              color: ColorManager.blackColor.withOpacity(0.25),
                              offset: Offset(0, 2),
                              blurRadius: 8,
                            ),
                          ],
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 16.h,
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 70.w,
                              height: 70.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.r),
                                border: Border.all(
                                  color: ColorManager.thirdColor,
                                ),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15.r),
                                child: Image.asset(
                                  'assets/images/chair.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(width: 16.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.productName,
                                  style: TextStyles.font16BlackRegular,
                                ),
                                Text(
                                  'Quantity: ${item.quantity}',
                                  style: TextStyles.font14GreyColorW400,
                                ),
                                Text(
                                  'Color: ${item.productColor}',
                                  style: TextStyles.font14PrimaryColorW400,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
