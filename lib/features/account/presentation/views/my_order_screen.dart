import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/core/widgets/custom_app_bar_widget.dart';

class MyOrderScreen extends StatelessWidget {
  const MyOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(text: 'My Order'),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(10.w),
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return null;
            //return const OrderListViewItem();
          },
        ),
      ),
    );
  }
}



/*Padding(
        padding: EdgeInsets.all(10.w),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'Order: Delivered',
                  style: TextStyles.font13OrderColorW300,
                ),
                const Spacer(),
                Text('May 15', style: TextStyles.font13OrderColorW300),
              ],
            ),
            Divider(color: ColorManager.thirdColor),
            ListTile(
              contentPadding: EdgeInsets.all(8.w),
              leading: Container(
                height: 96.h,
                width: 96.h,
                decoration: BoxDecoration(
                  color: ColorManager.backGroungColor,
                  borderRadius: BorderRadius.circular(13.r),
                ),
                child: Image.asset(
                  'assets/images/alejandrao_httpss.mj 6.png',
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(
                'Serenity Nightstand',
                style: TextStyles.font16WhiteW500.copyWith(
                  color: ColorManager.brounColor,
                ),
              ),
              subtitle: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'In a laoreet purus. Integer turpis quam, laoreet id orci nec, ultrices...',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyles.font12OrderColorW400,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('\$7.50', style: TextStyles.font14OrderColorW400),
                      Text('1x uds.', style: TextStyles.font14OrderColorW400),
                      Text(
                        'Total: \$7.50',
                        style: TextStyles.font14OrderColorW400,
                      ),
                    ],
                  ),
                ],
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset('assets/images/Bot-Trash.svg'),
                  SizedBox(width: 4.w),
                  SvgPicture.asset('assets/images/Bot-Add.svg'),
                ],
              ),
            ),
          ],
        ),
      ),*/