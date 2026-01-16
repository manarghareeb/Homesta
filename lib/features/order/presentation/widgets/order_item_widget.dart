import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/core/theming/styles.dart';
import 'package:homesta/core/widgets/custom_product_image.dart';
import 'package:homesta/features/order/data/models/payment_response/order_item.dart';

class OrderItemWidget extends StatelessWidget {
  final OrderItem item;

  const OrderItemWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.r),
            child: CustomProductImage(id: item.productId,width: 68.w,hight: 70.w,)
            //  Image.asset(
            //   'assets/images/image 1.png',
            //   width: 68.w,
            //   height: 70.w,
            //   fit: BoxFit.cover,
            // ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  item.productName,
                  style: TextStyles.font15BlackW500,
                  maxLines: 1,
                ),
                RichText(text: TextSpan(
                  text: 'Color: ',
                  style: TextStyles.font14BlackColorW400,
                  children: [
                    TextSpan(
                      text:item.productColor,
                      style: TextStyles.font14GreyColorW400,
                    )
                  ]
                )),
                RichText(text: TextSpan(
                  text: 'Quantity: ',
                  style: TextStyles.font14BlackColorW400,
                  children: [
                    TextSpan(
                      text: '${item.quantity}',
                      style: TextStyles.font14GreyColorW400,
                    )
                  ]
                )),
              ],
            ),
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: Text(
              '\$${item.finalUnitPrice}',
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
