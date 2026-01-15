import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/theming/styles.dart';
import 'package:homesta/core/widgets/custom_app_bar_widget.dart';
import 'package:homesta/features/admin/dashboard/presentation/widgets/analytics_container.dart';
import 'package:homesta/features/seller/analytics/presentation/widgets/data_analytics.dart';

import '../../../../order/presentation/cubit/user_orders_cubit/user_orders_cubit.dart';
import '../../../../order/presentation/cubit/user_orders_cubit/user_orders_state.dart';
import '../../../../product/presentation/cubits/product_cubit.dart';
import '../../../../product/presentation/cubits/product_state.dart';
import '../../../../seller/profile/presentation/cubits/store_cubit.dart';
import '../../../../seller/profile/presentation/cubits/store_state.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    super.initState();
    context.read<StoreCubit>().getAllStores();
    context.read<ProductCubit>().getAllProducts();
    context.read<UserOrdersCubit>().getUserOrders();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBarWidget(text: 'Dashboard'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Column(
            children: [
              /// القسم العلوي (Analytics)
              AnalyticsContainer(
                firstRowItem1: BlocBuilder<StoreCubit, StoreState>(
                  builder: (context, state) {
                    if (state is StoreLoading) {
                      return DataAnalytics(title: 'Companies', subTitle: '...');
                    } else if (state is StoresSuccess) {
                      return DataAnalytics(
                        title: 'Companies',
                        subTitle: state.stores.length.toString(),
                      );
                    } else {
                      return DataAnalytics(title: 'Companies', subTitle: 'Error');
                    }
                  },
                ),
                firstRowItem2: BlocBuilder<ProductCubit, ProductState>(
                  builder: (context, state) {
                    if (state is ProductLoading) {
                      return DataAnalytics(title: 'Products', subTitle: '...');
                    } else if (state is ProductSuccess) {
                      return DataAnalytics(
                        title: 'Products',
                        subTitle: state.products.length.toString(),
                      );
                    } else {
                      return DataAnalytics(title: 'Products', subTitle: 'Error');
                    }
                  },
                ),
                secondRowItem1: BlocBuilder<UserOrdersCubit, UserOrdersState>(
                  builder: (context, state) {
                    if (state is UserOrdersLoading) {
                      return DataAnalytics(title: 'Orders', subTitle: '...');
                    } else if (state is UserOrdersLoaded) {
                      return DataAnalytics(
                        title: 'Orders',
                        subTitle: state.orders.length.toString(),
                      );
                    } else {
                      return DataAnalytics(title: 'Orders', subTitle: 'Error');
                    }
                  },
                ),
                secondRowItem2: BlocBuilder<UserOrdersCubit, UserOrdersState>(
                  builder: (context, state) {
                    if (state is UserOrdersLoading) {
                      return DataAnalytics(title: 'Revenue', subTitle: '...');
                    } else if (state is UserOrdersLoaded) {
                      final revenue = state.orders.fold<double>(
                        0,
                            (sum, order) => sum + (order.totalPrice ?? 0),
                      );
                      return DataAnalytics(
                        title: 'Revenue',
                        subTitle: revenue.toStringAsFixed(2),
                      );
                    } else {
                      return DataAnalytics(title: 'Revenue', subTitle: 'Error');
                    }
                  },
                ),
              ),

              const SizedBox(height: 24),

              /// قائمة الشركات المسجلة
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                      color: Colors.black.withOpacity(0.25),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Text(
                      'Registered Companies',
                      style: TextStyles.font16BlackW500,
                    ),
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: ColorManager.aliceBlue,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Text('Company',
                                style: TextStyles.font16PrimaryColorW400),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text('Email',
                                style: TextStyles.font16PrimaryColorW400),
                          ),
                          Text('Action',
                              style: TextStyles.font16PrimaryColorW400),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),

                    BlocBuilder<StoreCubit, StoreState>(
                      builder: (context, state) {
                        if (state is StoresSuccess) {
                          return Column(
                            children: state.stores.map((store) {
                              return Padding(
                                padding:
                                const EdgeInsets.symmetric(vertical: 6.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Text(
                                        store.name,
                                        style: TextStyles.font13BlackW500,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Text(
                                        store.email,
                                        style: TextStyles.font13BlackW500,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    IconButton(
                                      icon: Icon(Icons.delete_outline_outlined,
                                          color: ColorManager.redColor),
                                      onPressed: () async {
                                        await context
                                            .read<StoreCubit>()
                                            .deleteStore(store.storeId);

                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                            content: Text(
                                                "Store deleted successfully"),
                                            backgroundColor: Colors.green,
                                            duration: Duration(seconds: 2),
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              );
                            }).toList(),
                          );
                        } else if (state is StoreLoading) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else if (state is StoreError) {
                          return Text("Error: ${state.message}");
                        }
                        return const SizedBox.shrink();
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
