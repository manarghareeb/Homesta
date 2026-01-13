import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/theming/styles.dart';

class OrderTimeline extends StatelessWidget {
  final String currentStatus; 
  final String orderDateFormatted; 

  const OrderTimeline({
    super.key,
    required this.currentStatus,
    required this.orderDateFormatted,
  });

  @override
  Widget build(BuildContext context) {
    final steps = [
      'Pending',
      'Processing',
      'Shipped',
      'Delivered',
      'Cancelled'
    ];
    
    return Column(
      children: List.generate(steps.length, (index) {
        final step = steps[index];
        final bool isDone = steps.indexOf(currentStatus) > index || steps.indexOf(currentStatus) == index;
        final bool isLast = index == steps.length - 1;
        final bool isCurrent = currentStatus == step;
        final iconMap = {
          'Pending': FontAwesomeIcons.clipboardList,
          'Processing': FontAwesomeIcons.clipboardList,
          'Shipped': FontAwesomeIcons.box,
          'Delivered': Icons.local_shipping,
          'Cancelled': Icons.home_filled
        };

        return IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 16.w,
                    height: 16.w,
                    decoration: BoxDecoration(
                      color:
                          isDone
                              ? ColorManager.primaryColor
                              : ColorManager.greyColor,
                      border: Border.all(
                        color:
                            isDone
                                ? ColorManager.primaryColor
                                : ColorManager.greyColor,
                      ),
                    ),
                    child: Icon(Icons.check, size: 14, color: Colors.white),
                  ),
                  if (!isLast)
                    Flexible(
                      child: Container(
                        width: 2.w,
                        color:
                            isDone
                                ? ColorManager.primaryColor
                                : ColorManager.greyColor,
                      ),
                    ),
                ],
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(top: 4.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        step,
                        style: TextStyles.font16BlackRegular,
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        orderDateFormatted,
                        style:
                            isDone
                                ? TextStyles.font14deepGreyColorW400
                                : TextStyles.font14GreyColorW400,
                      ),
                      SizedBox(height: 32.h),
                    ],
                  ),
                ),
              ),
              Icon(
                iconMap[step],
                color:
                    isDone ? ColorManager.primaryColor : ColorManager.greyColor,
              ),
            ],
          ),
        );
      }),
    );
  }
}
