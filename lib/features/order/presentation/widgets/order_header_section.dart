import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/theming/styles.dart';
import 'package:homesta/core/widgets/custom_button_widget.dart';
import 'package:homesta/features/order/data/models/user_orders_response.dart';
import 'package:homesta/features/order/presentation/widgets/order_info_section.dart';

class OrderHeaderSection extends StatelessWidget {
  final UserOrdersResponse order;
  final bool showDetails;
  final VoidCallback onToggleDetails;

  const OrderHeaderSection({
    super.key,
    required this.order,
    required this.showDetails,
    required this.onToggleDetails,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(12.w),
          decoration: BoxDecoration(
            color: const Color(0xFFF0F3FF),
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Column(
            children: [
              OrderInfoSection(
                items: [
                  OrderInfoItem(
                    label: "Order ID",
                    value: order.orderId.toString(),
                  ),
                  OrderInfoItem(
                    label: "Total Payment",
                    value: '${order.totalPrice}',
                  ),
                ],
              ),
              SizedBox(height: 12.h),
              OrderInfoSection(
                items: [
                  OrderInfoItem(
                    label: "Payment Method",
                    value: order.paymentMethod,
                  ),
                  OrderInfoItem(
                    label: "Delivery Date",
                    value: order.orderDateFormatted,
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 12.h),
        Divider(height: 24.h, color: ColorManager.lightGreyColor),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
              decoration: BoxDecoration(
                color: order.status == "Accepted"
                    ? const Color(0xFFFFF1E3)
                    : const Color(0xFFFC5FBD2),
                borderRadius: BorderRadius.circular(20.r),
                border: Border.all(
                  color: order.status == "Accepted"
                      ? const Color(0xFFB19470)
                      : const Color(0xFF7BC370),
                  width: 1.5,
                ),
              ),
              child: Text(
                order.status,
                style: TextStyles.font16BlackRegular.copyWith(
                  color: order.status == "Accepted"
                      ? const Color(0xFFB19470)
                      : const Color(0xFF7BC370),
                ),
              ),
            ),
            CustomButtonWidget(
              buttonText: showDetails ? 'Hide Details' : 'View Details',
              onPressed: onToggleDetails,
              minWidth: 120,
            ),
          ],
        ),
      ],
    );
  }
}
