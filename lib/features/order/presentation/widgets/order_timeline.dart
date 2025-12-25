import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/theming/styles.dart';

class OrderTimeline extends StatelessWidget {
  const OrderTimeline({super.key});

  @override
  Widget build(BuildContext context) {
    final steps = [
      {
        'title': 'Order Placed',
        'date': '20 Apr 2025\n11:00 AM',
        'done': true,
        'icon': FontAwesomeIcons.clipboardList,
      },
      {
        'title': 'Accepted',
        'date': '20 Apr 2025\n11:00 AM',
        'done': true,
        'icon': FontAwesomeIcons.clipboardList,
      },
      {
        'title': 'In Progress',
        'date': 'Expected\n21 Apr 2025',
        'done': false,
        'icon': FontAwesomeIcons.box,
      },
      {
        'title': 'On the Way',
        'date': 'Expected\n22,23 Apr 2025',
        'done': false,
        'icon': Icons.local_shipping,
      },
      {
        'title': 'Delivered',
        'date': 'Expected\n24 Apr 2025',
        'done': false,
        'icon': Icons.home_filled,
      },
    ];

    return Column(
      children: List.generate(steps.length, (index) {
        final step = steps[index];
        final bool isDone = step['done'] as bool;
        final bool isLast = index == steps.length - 1;

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
                        step['title'] as String,
                        style: TextStyles.font16BlackRegular,
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        step['date'] as String,
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
                step['icon'] as IconData? ?? Icons.circle,
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
