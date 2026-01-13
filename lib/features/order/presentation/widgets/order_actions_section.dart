import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:homesta/core/routing/app_router.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/theming/styles.dart';

class OrderActionsSection extends StatelessWidget {
  final List<String> actions;

  const OrderActionsSection({super.key, required this.actions});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: actions.map((action) {
        final bool isTrackOrReview =
            action == "Track Order" || action == "Add Review";
        final bool isCancel = action.toLowerCase().contains("cancel");

        return Padding(
          padding: EdgeInsets.only(bottom: 12.h),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: isTrackOrReview
                  ? ColorManager.primaryColor
                  : Colors.white,
              foregroundColor: isTrackOrReview
                  ? Colors.white
                  : (isCancel ? Colors.red : ColorManager.primaryColor),
              side: BorderSide(
                color: isTrackOrReview
                    ? ColorManager.primaryColor
                    : (isCancel ? Colors.red : ColorManager.primaryColor),
                width: 1.5,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.r),
              ),
              padding: EdgeInsets.symmetric(vertical: 12.h),
            ),
            onPressed: () {
              if (action == "Track Order") {
                GoRouter.of(context).push(AppRouter.trackOrder);
              } else if (action == "Invoice") {
                GoRouter.of(context).push(AppRouter.invoice);
              } else if (action == "Cancel Order") {
                GoRouter.of(context).push(AppRouter.cancelOrder);
              } else if (action == "Add Review") {
                GoRouter.of(context).push(AppRouter.addReview);
              }
            },
            child: Text(
              action,
              style: TextStyles.font15BlackW500.copyWith(
                color: isTrackOrReview
                    ? Colors.white
                    : (isCancel ? Colors.red : ColorManager.primaryColor),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
