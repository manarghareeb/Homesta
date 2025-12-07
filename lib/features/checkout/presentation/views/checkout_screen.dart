import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/theming/styles.dart';
import 'package:homesta/core/widgets/custom_app_bar_widget.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBarWidget(
        text: 'Checkout',
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: TextButton(
              onPressed: (){}, 
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                minimumSize: Size(42.w, 24.h),
                maximumSize: Size(42.w, 24.h),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                foregroundColor: ColorManager.mainColor,
                elevation: 0,
                backgroundColor: ColorManager.mainColor
              ),
              child: Text('10sn', style: TextStyles.font13BrownW400.copyWith(
              color: ColorManager.blackColor,
              ),),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: const AssetImage('assets/images/image 1.png'),
                  radius: 40.r,
                ),
                SizedBox(width: 8.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('John Doe', style: TextStyles.font14BlackColorW400,),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on_outlined, 
                          size: 14.w, 
                          color: ColorManager.blackColor,
                        ),
                        SizedBox(width: 4.w),
                        Text('Cairo, Egypt', style: TextStyles.font14BlackColorW400,),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.timer_sharp, 
                          size: 14.w, 
                          color: ColorManager.blackColor,
                        ),
                        SizedBox(width: 4.w),
                        Text(
                          ' Nov 23 – 22:00', 
                          style: TextStyles.font14BlackColorW400,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 8.h),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: ColorManager.mainColor,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                  child: Text(
                    'Adult/ A. Category/C Block',
                    style: TextStyles.font14BlackColorW400,
                    selectionColor: ColorManager.mainColor,
                  ),
                ),
                SizedBox(width: 8.w),
                Container(
                  decoration: BoxDecoration(
                    color: ColorManager.mainColor,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                  child: Text(
                    'x1',
                    style: TextStyles.font14BlackColorW400,
                    selectionColor: ColorManager.mainColor,
                  ),
                ),
              ],
            ),
            SizedBox(height: 24.h),
            Divider(color: ColorManager.greyColor, thickness: 1.h),
            SizedBox(height: 16.h),
            Text('Payment Method', style: TextStyles.font16BlackRegular.copyWith(
              fontWeight: FontWeight.w500
            ),),
            SizedBox(height: 16.h),
          ],
        ),
      ),
    );
  }
}