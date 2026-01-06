import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/theming/styles.dart';

class FAQItemWidget extends StatefulWidget {
  final String question;
  final String answer;

  const FAQItemWidget({
    super.key,
    required this.question,
    required this.answer,
  });

  @override
  State<FAQItemWidget> createState() => _FAQItemWidgetState();
}

class _FAQItemWidgetState extends State<FAQItemWidget> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    if (!isExpanded) {
      return Column(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                isExpanded = true;
              });
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(widget.question, style: TextStyles.font14BlackColorW400),
                Icon(Icons.add, color: ColorManager.primaryColor),
              ],
            ),
          ),
          SizedBox(height: 16.h),
        ],
      );
    } else {
      return Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
            width: double.infinity,
            decoration: BoxDecoration(
              color: ColorManager.primaryColor,
              borderRadius: BorderRadius.circular(15.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        widget.question,
                        style: TextStyles.font14WhiteColorW400.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isExpanded = false;
                        });
                      },
                      child: Icon(
                        Icons.remove,
                        color: ColorManager.thirdColor,
                        size: 15.sp,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.h),
                Text(
                  widget.answer,
                  textAlign: TextAlign.start,
                  style: TextStyles.font14GreyColorW400.copyWith(
                    fontSize: 13.sp,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16.h),
        ],
      );
    }
  }
}
