import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/theming/styles.dart';

import '../../../../core/routing/app_router.dart';
import '../../../../core/widgets/custom_app_bar_widget.dart';


class MyOrderScreen extends StatefulWidget {
  const MyOrderScreen({super.key});

  @override
  State<MyOrderScreen> createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyOrderScreen> {
  bool showAll = false;

  final orders = [
    OrderModel(
      orderId: "#SDGT1254FD",
      totalPayment: "\$840.00",
      paymentMethod: "Paypal",
      deliveryDate: "24 April 2024",
      items: [
        OrderItemModel("Wingback Chair", "Light Brown", "\$320.00", "assets/images/bar_stool.png"),
        OrderItemModel("Wooden Sofa Chair", "Grey", "\$180.00", "assets/images/bar_stool.png"),
        OrderItemModel("Bar Stool", "Brown", "\$60.00", "assets/images/bar_stool.png"),
        OrderItemModel("Brown Bean Bag Chair", "Brown", "\$180.00", "assets/images/bar_stool.png"),
      ],
      status: "Accepted",
      statusMessage: "Your Order has been Accepted",
      actions: ["Track Order", "Invoice", "Cancel Order"],
    ),
    OrderModel(
      orderId: "#SDGT1254FD",
      totalPayment: "\$375.00",
      paymentMethod: "Cash",
      deliveryDate: "24 April 2024",
      items: [
        OrderItemModel("Brown Bean Bag Chair", "Brown", "\$375.00", "assets/images/bar_stool.png"),
      ],
      status: "Delivered",
      statusMessage: "Your Order has been Delivered",
      actions: ["Add Review", "Invoice"],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final displayedOrders = showAll ? orders : [orders.last];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBarWidget(
        text: 'My Orders',
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// السطر اللي فيه عدد الطلبات و Dropdown
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Orders (${orders.length})",
                  style: TextStyles.font16BlackW500,
                ),
                DropdownButton<String>(
                  value: showAll ? "All" : "Latest",
                  dropdownColor: Colors.white,
                  underline: const SizedBox(),
                  items: const [
                    DropdownMenuItem(value: "Latest", child: Text("Latest")),
                    DropdownMenuItem(value: "All", child: Text("All")),
                  ],
                  onChanged: (value) {
                    setState(() {
                      showAll = value == "All";
                    });
                  },
                ),
              ],
            ),

            SizedBox(height: 16.h),

            /// قائمة الطلبات
            Expanded(
              child: ListView.separated(
                itemCount: displayedOrders.length,
                separatorBuilder: (_, __) => SizedBox(height: 20.h),
                itemBuilder: (context, index) {
                  return OrderCard(order: displayedOrders[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class OrderModel {
  final String orderId;
  final String totalPayment;
  final String paymentMethod;
  final String deliveryDate;
  final List<OrderItemModel> items;
  final String status;
  final String statusMessage;
  final List<String> actions;

  OrderModel({
    required this.orderId,
    required this.totalPayment,
    required this.paymentMethod,
    required this.deliveryDate,
    required this.items,
    required this.status,
    required this.statusMessage,
    required this.actions,
  });
}

/// نموذج بيانات المنتج داخل الطلب
class OrderItemModel {
  final String name;
  final String color;
  final String price;
  final String image;

  OrderItemModel(this.name, this.color, this.price, this.image);
}

/// كرت الطلب
class OrderCard extends StatelessWidget {
  final OrderModel order;

  const OrderCard({super.key, required this.order});

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
          /// معلومات الطلب داخل Container بلون أزرق فاتح
          Container(
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              color: const Color(0xFFF0F3FF),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Column(
              children: [
                /// الصف الأول: Order ID + Total Payment مع خط عمودي بينهما
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Order ID", style: TextStyles.font14GreyColorW400),
                          SizedBox(height: 4.h),
                          Text(order.orderId, style: TextStyles.font14BlackColorW500),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 40.h,
                      child: VerticalDivider(
                        color: ColorManager.lightGreyColor,
                        thickness: 2,
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Total Payment", style: TextStyles.font14GreyColorW400),
                          SizedBox(height: 4.h),
                          Text(order.totalPayment, style: TextStyles.font14BlackColorW500),
                        ],
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 12.h),

                /// الصف الثاني: Payment Method + Delivery Date مع خط عمودي بينهما
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Payment Method", style: TextStyles.font14GreyColorW400),
                          SizedBox(height: 4.h),
                          Text(order.paymentMethod, style: TextStyles.font14BlackColorW500),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 40.h,
                      child: VerticalDivider(
                        color: ColorManager.lightGreyColor,
                        thickness: 2,
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Delivery Date", style: TextStyles.font14GreyColorW400),
                          SizedBox(height: 4.h),
                          Text(order.deliveryDate, style: TextStyles.font14BlackColorW500),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          SizedBox(height: 12.h),

          /// المنتجات
          ...order.items.map((item) => OrderItemWidget(item: item)),

          Divider(height: 24.h, color: ColorManager.lightGreyColor),

          /// الحالة داخل Container بالألوان المطلوبة
          Container(
            padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
            decoration: BoxDecoration(
              color: order.status == "Accepted"
                  ? const Color(0xFFFFF1E3) // خلفية Accepted
                  : const Color(0xFFFC5FBD2), // خلفية Delivered
              borderRadius: BorderRadius.circular(20.r),
              border: Border.all(
                color: order.status == "Accepted"
                    ? const Color(0xFFB19470) // إطار Accepted
                    : const Color(0xFF7BC370), // إطار Delivered
                width: 1.5,
              ),
            ),
            child: Text(
              order.status,
              style: TextStyles.font16BlackRegular.copyWith(
                color: order.status == "Accepted"
                    ? const Color(0xFFB19470) // نص Accepted
                    : const Color(0xFF7BC370), // نص Delivered
              ),
            ),
          ),

          SizedBox(height: 4.h),

          /// رسالة الحالة كنص عادي تحت الـ Container
          Text(
            order.statusMessage,
            style: TextStyles.font16BlackRegular,
          ),

          SizedBox(height: 12.h),

          /// الأزرار
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: order.actions.map((action) {
              final bool isTrackOrReview = action == "Track Order" || action == "Add Review";
              final bool isCancel = action.toLowerCase().contains("cancel");

              return Padding(
                padding: EdgeInsets.only(bottom: 12.h),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isTrackOrReview
                        ? ColorManager.primaryColor
                        : Colors.white,
                    foregroundColor: isTrackOrReview
                        ? Colors.white
                        : (isCancel ? Colors.red : ColorManager.primaryColor),
                    side: BorderSide(
                      color: isTrackOrReview
                          ? ColorManager.primaryColor
                          : (isCancel ? Colors.red : ColorManager.primaryColor),
                      width: 1.5,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 12.h),
                  ),
                  onPressed: () {
                    if (action == "Track Order") {
                      GoRouter.of(context).push(AppRouter.trackOrder);
                    } else if (action == "Invoice") {
                      GoRouter.of(context).push(AppRouter.invoice);
                    } else if (action == "Cancel Order") {
                      GoRouter.of(context).push(AppRouter.cancelOrder);
                    } else if (action == "Add Review") {
                      GoRouter.of(context).push(AppRouter.addReview);
                    }
                  },
                  child: Text(
                    action,
                    style: TextStyles.font15BlackW500.copyWith(
                      color: isTrackOrReview
                          ? Colors.white
                          : (isCancel ? Colors.red : ColorManager.primaryColor),
                    ),
                  ),
                ),
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}

/// عنصر منتج داخل الطلب
class OrderItemWidget extends StatelessWidget {
  final OrderItemModel item;

  const OrderItemWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// صورة المنتج
          ClipRRect(
            borderRadius: BorderRadius.circular(10.r),
            child: Image.asset(
              item.image,
              width: 68.w,
              height: 70.w,
              fit: BoxFit.cover,
            ),
          ),

          SizedBox(width: 12.w),

          /// اسم المنتج + اللون
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  style: TextStyles.font15BlackW500,
                  maxLines: 1,
                ),
                Text(
                  "Color: ${item.color}",
                  style: TextStyles.font14GreyColorW400,
                  maxLines: 1,
                ),
              ],
            ),
          ),

          SizedBox(width: 8.w),

          /// السعر
          Expanded(
            child: Text(
              item.price,
              style: TextStyles.font15BlackW500,
              textAlign: TextAlign.end,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
        ],
      ),
    );
  }
}
/// صف معلومات (Label + Value)
class InfoRow extends StatelessWidget {
  final String label;
  final String value;
  final Color? valueColor;

  const InfoRow({super.key, required this.label, required this.value, this.valueColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: TextStyles.font14GreyColorW400,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
          Flexible(
            child: Text(
              value,
              style: TextStyles.font14BlackColorW400.copyWith(color: valueColor ?? ColorManager.blackColor),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }
}
