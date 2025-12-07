/*import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/theming/styles.dart';

class OrderListViewItem extends StatelessWidget {
  const OrderListViewItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 35.h),
      child: Column(
        children: [
          Row(
            children: [
              Text('Order: Delivered', style: TextStyles.font13OrderColorW300,),
              const Spacer(),
              Text('May 15', style: TextStyles.font13OrderColorW300,),
            ],
          ),
          Divider(
            color: ColorManager.thirdColor,
          ),
          Row(
            children: [
              Container(
                height: 96.h,
                width: 96.h,
                decoration: BoxDecoration(
                  color: ColorManager.backGroungColor,
                  borderRadius: BorderRadius.circular(13.r)
                ),
                child: Image.asset(
                  'assets/images/alejandrao_httpss.mj 6.png',
                  height: 90.h,
                  width: 90.h,
                ),
              ),
              SizedBox(width: 12.w,),
              Expanded(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Serenity Nightstand', 
                                style: TextStyles.font16WhiteW500.copyWith(
                                  color: ColorManager.brounColor
                                ),
                              ),
                              Text(
                                'In a laoreet purus. Integer turpis quam, laoreet id orci nec, ultrices...',
                                style: TextStyles.font12OrderColorW400.copyWith(
                                  fontFamily: 'Outfit',
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              )
                            ],
                          ),
                        ),
                        SizedBox(width: 8.w,),
                        SvgPicture.asset('assets/images/Bot-Trash.svg'),
                        SizedBox(width: 4.w,),
                        SvgPicture.asset('assets/images/Bot-Add.svg'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('\$7.50', style: TextStyles.font14OrderColorW400,),
                        Text('1x uds.', style: TextStyles.font14OrderColorW400,),
                        Text('Total: \$7.50', style: TextStyles.font14OrderColorW400,),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}*/
