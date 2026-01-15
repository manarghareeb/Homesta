import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/theming/styles.dart';
import 'package:homesta/features/home/presentation/widgets/count_container.dart';

class YourCardItem extends StatelessWidget {
  const YourCardItem({
    super.key,
    required this.image,
    required this.name,
    required this.color,
    required this.price,
    //required this.quantity,
    required this.onPressedDelete,
    required this.onQuantityChanged
  });
  final String image;
  final String name;
  final String color;
  final double price;
  //final double quantity;
  final Function() onPressedDelete;
  final Function(int)? onQuantityChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15.r),
            child: Image.asset(
              image,
              width: 137.w,
              height: 111.h,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: TextStyles.font16BlackRegular),
                SizedBox(height: 8.h),
                RichText(
                  text: TextSpan(
                    text: 'Color: ',
                    style: TextStyles.font14BlackColorW400,
                    children: [
                      TextSpan(
                        text: color,
                        style: TextStyles.font14GreyColorW400,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 12.h),
                CountContainer(
                  onQuantityChanged: onQuantityChanged,
                  padding: EdgeInsets.symmetric(
                    vertical: 7.4.h,
                    horizontal: 11.5.w,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 12.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              IconButton(
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                icon: Icon(Icons.delete, color: ColorManager.greyColor),
                onPressed: onPressedDelete,
              ),
              SizedBox(height: 15.h),
              Text('\$$price', style: TextStyles.font14BlackColorW400),
            ],
          ),
        ],
      ),
    );
  }
}
