import 'package:flutter/material.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/theming/styles.dart';
import 'package:homesta/core/widgets/custom_app_bar_widget.dart';
import 'package:homesta/features/admin/dashboard/presentation/widgets/analytics_container.dart';
import 'package:homesta/features/seller/analytics/presentation/widgets/data_analytics.dart';


class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

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
              AnalyticsContainer(
                firstRowItem1: DataAnalytics(title: 'Companies', subTitle: '10'),// هاي لازم اشيلها واحط يلي تحتها بس لتجهز ال seller
                firstRowItem2: DataAnalytics(title: 'Companies', subTitle: '10'),// هاي لازم اشيلها واحط يلي تحتها بس لتجهز ال seller
                // firstRowItem1: BlocBuilder<StoreCubit, StoreState>(
                //   builder: (context, state) {
                //     if (state is StoreLoading) {
                //       return DataAnalytics(title: 'Companies', subTitle: '...');
                //     } else if (state is StoreSuccess) {
                //       return DataAnalytics(
                //         title: 'Companies',
                //         subTitle: state.stores.length.toString(),
                //       );
                //     } else {
                //       return DataAnalytics(title: 'Companies', subTitle: 'Error');
                //     }
                //   },
                // ),
                ////////////////////////
                // firstRowItem2: BlocBuilder<ProductCubit, ProductState>(
                //   builder: (context, state) {
                //     if (state is ProductLoading) {
                //       return DataAnalytics(title: 'Products', subTitle: '...');
                //     } else if (state is ProductSuccess) {
                //       return DataAnalytics(
                //         title: 'Products',
                //         subTitle: state.products.length.toString(),
                //       );
                //     } else {
                //       return DataAnalytics(title: 'Products', subTitle: 'Error');
                //     }
                //   },
                // ),
                secondRowItem1: DataAnalytics(title: 'Orders', subTitle: '200'),
                secondRowItem2: DataAnalytics(title: 'Revenue', subTitle: '500'),
              ),
              SizedBox(height: 24),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 8,
                      offset: Offset(0, 2),
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
                    SizedBox(height: 16),
                    Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: ColorManager.aliceBlue,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Company',
                            style: TextStyles.font16PrimaryColorW400,
                          ),
                          Text(
                            'Email',
                            style: TextStyles.font16PrimaryColorW400,
                          ),
                          Text(
                            'Action',
                            style: TextStyles.font16PrimaryColorW400,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('CasaLux', style: TextStyles.font13BlackW500),
                        Text(
                          'info@casalux.com',
                          style: TextStyles.font13BlackW500,
                        ),
                        Icon(
                          Icons.delete_outlined,
                          color: ColorManager.redColor,
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    // هاد لازم احذفه واحط يلي تحته لما يجهز الستور
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('HomeStyle', style: TextStyles.font13BlackW500),
                        Text(
                          'info@HomeStyle.com',
                          style: TextStyles.font13BlackW500,
                        ),
                        Icon(
                          Icons.delete_outlined,
                          color: ColorManager.redColor,
                        ),
                      ],
                    ),
                    // BlocBuilder<StoreCubit, StoreState>(
                    //   builder: (context, state) {
                    //     if (state is StoreSuccess) {
                    //       return Column(
                    //         children: state.stores.map((store) {
                    //           return Row(
                    //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //             children: [
                    //               Text(store.name, style: TextStyles.font13BlackW500),
                    //               Text(store.email, style: TextStyles.font13BlackW500),
                    //               Icon(Icons.delete_outlined, color: ColorManager.redColor),
                    //             ],
                    //           );
                    //         }).toList(),
                    //       );
                    //     }
                    //     return const SizedBox.shrink();
                    //   },
                    // ),

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
