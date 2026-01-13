import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homesta/core/theming/styles.dart';
import 'package:homesta/features/order/presentation/cubit/user_orders_cubit/user_orders_cubit.dart';
import 'package:homesta/features/order/presentation/cubit/user_orders_cubit/user_orders_state.dart';
import 'package:homesta/features/order/presentation/widgets/order_card.dart';
import '../../../../core/widgets/custom_app_bar_widget.dart';

class MyOrderScreen extends StatefulWidget {
  const MyOrderScreen({super.key});

  @override
  State<MyOrderScreen> createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyOrderScreen> {
  bool showAll = false;

  @override
  void initState() {
    super.initState();
    context.read<UserOrdersCubit>().getUserOrders();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBarWidget(text: 'My Orders'),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: BlocBuilder<UserOrdersCubit, UserOrdersState>(
                builder: (context, state) {
                  if (state is UserOrdersLoading) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state is UserOrdersLoaded) {
                    final orders = state.orders;
                    final displayedOrders =
                        showAll ? orders : [orders.last]; 
              
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                                DropdownMenuItem(
                                    value: "Latest", child: Text("Latest")),
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
                    );
                  } else if (state is UserOrdersError) {
                    return Center(child: Text(state.message));
                  } else {
                    return const SizedBox();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}


/*import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/core/theming/styles.dart';
import 'package:homesta/features/order/presentation/widgets/order_card.dart';
import '../../../../core/widgets/custom_app_bar_widget.dart';

class MyOrderScreen extends StatefulWidget {
  const MyOrderScreen({super.key});

  @override
  State<MyOrderScreen> createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyOrderScreen> {
  bool showAll = false;

  @override
  Widget build(BuildContext context) {
    final displayedOrders = showAll ? orders : [orders.last];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBarWidget(text: 'My Orders'),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
*/
