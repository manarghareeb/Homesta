import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/theming/styles.dart';
import 'package:homesta/core/widgets/custom_product_image.dart';

class CartItemWidget extends StatefulWidget {
  final String name;
  final String color;
  final String image;
  final double price;
  final int quantity;
  final void Function() onPressedDeleted;
 final int id;

  const CartItemWidget({
    super.key,
    required this.name,
    required this.color,
    required this.image,
    required this.price,
    required this.id,
    required this.onPressedDeleted, required this.quantity,
  });

  @override
  State<CartItemWidget> createState() => _CartItemWidgetState();
}

class _CartItemWidgetState extends State<CartItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.r),
        boxShadow: [
          BoxShadow(
            color: ColorManager.blackColor.withOpacity(0.25),
            offset: Offset(0, 2),
            blurRadius: 4,
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
              child: CustomProductImage(id: widget.id)
              //Image.asset(widget.image, fit: BoxFit.cover),
            ),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.name, style: TextStyles.font16BlackRegular),
                RichText(
                  text: TextSpan(
                    text: 'Color : ',
                    style: TextStyles.font14BlackColorW400,
                    children: [
                      TextSpan(
                        text: widget.color,
                        style: TextStyles.font14PrimaryColorW400,
                      ),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text: 'Price : ',
                    style: TextStyles.font14BlackColorW400,
                    children: [
                      TextSpan(
                        text: '\$${widget.price.toStringAsFixed(0)}',
                        style: TextStyles.font14PrimaryColorW400,
                      ),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text: 'Quantity : ',
                    style: TextStyles.font14BlackColorW400,
                    children: [
                      TextSpan(
                        text: '${widget.quantity}',
                        style: TextStyles.font14PrimaryColorW400,
                      ),
                    ],
                  ),
                ),
                /*Text(
                  '\$${widget.price.toStringAsFixed(0)}',
                  style: TextStyles.font14ThirdColorW400,
                ),*/
              ],
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              IconButton(
                padding: EdgeInsets.zero,
                constraints: BoxConstraints(),
                icon: Icon(Icons.delete, color: ColorManager.primaryColor),
                onPressed: widget.onPressedDeleted,
              ),
              SizedBox(height: 4.h),
              //const QuantitySelectorSection(),
            ],
          ),
        ],
      ),
    );
  }
}
