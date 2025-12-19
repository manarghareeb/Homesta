import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/theming/styles.dart';

class ProductOverlayActionsSection extends StatelessWidget {
  final VoidCallback onSimilarPressed;
  final VoidCallback onDeletePressed;
  final String message;

  const ProductOverlayActionsSection({
    super.key,
    required this.onSimilarPressed,
    required this.onDeletePressed,
    this.message = '',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.8),
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 16.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (message.isNotEmpty)
                Text(
                  message,
                  style: TextStyles.font16WhiteW500
                      .copyWith(color: ColorManager.soLightGreyColor),
                ),
              if (message.isNotEmpty) SizedBox(height: 16.h),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: onSimilarPressed,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorManager.primaryColor,
                    padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 8.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                  child: Text(
                    'Similar Product',
                    style: TextStyles.font14BlackColorW400.copyWith(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: onDeletePressed,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorManager.soLightGreyColor.withOpacity(0),
                    padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 8.h),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: ColorManager.redColor
                      ),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                  child: Text(
                    'Delete',
                    style: TextStyles.font14BlackColorW400.copyWith(color: ColorManager.redColor),
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
