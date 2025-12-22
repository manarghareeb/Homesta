import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/theming/styles.dart';
import 'package:homesta/core/widgets/custom_app_bar_widget.dart';
import 'package:homesta/features/order/presentation/widgets/order_timeline.dart';

class TrackOrderDetailsScreen extends StatefulWidget {
  const TrackOrderDetailsScreen({super.key});

  @override
  State<TrackOrderDetailsScreen> createState() =>
      _TrackOrderDetailsScreenState();
}

class _TrackOrderDetailsScreenState extends State<TrackOrderDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBarWidget(text: 'Track Your Order'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Order Status', style: TextStyles.font16BlackW500),
              SizedBox(height: 8.h),
              Text(
                'Order ID: #SDGT1254FD',
                style: TextStyles.font16DeepGeyColorRegular,
              ),
              SizedBox(height: 16.h),
              const OrderTimeline(),
              Text('Products', style: TextStyles.font16BlackW500),
              SizedBox(height: 16.h),
              Padding(
                padding: const EdgeInsets.all(8.0),
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
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 70.w,
                        height: 70.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.r),
                          border: Border.all(color: ColorManager.thirdColor),
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
                            'Modern Chair',
                            style: TextStyles.font16BlackRegular,
                          ),
                          RichText(
                            text: TextSpan(
                              text: 'Color : ',
                              style: TextStyles.font14BlackColorW400,
                              children: [
                                TextSpan(
                                  text: 'Green',
                                  style: TextStyles.font14PrimaryColorW400,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          IconButton(
                            padding: EdgeInsets.zero,
                            constraints: BoxConstraints(),
                            icon: Icon(
                              Icons.delete,
                              color: ColorManager.primaryColor,
                            ),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
