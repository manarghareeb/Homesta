import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:homesta/core/routing/app_router.dart';
import 'package:homesta/core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/widgets/custom_button_widget.dart';

class DealsOfDayWidget extends StatelessWidget {
  const DealsOfDayWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// ===== Title =====
        Row(
          children: [
            Text("Deals ", style: TextStyles.font16PrimaryColorW400),
            Text("of the Day", style: TextStyles.font16BlackW500),
          ],
        ),

        SizedBox(height: 20.h),

        /// ===== Deals =====
        DealItem(
          image: 'assets/images/deals_of_day_image/Frame 1984080392.png',
        ),
        SizedBox(height: 20.h),
        DealItem(
          image: 'assets/images/deals_of_day_image/Frame 1984080161.png',
        ),
      ],
    );
  }
}

class DealItem extends StatelessWidget {
  const DealItem({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// ================= LEFT CONTENT =================
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text('Chair', style: TextStyles.font14deepGreyColorW400),
                  SizedBox(width: 8.w),
                  const Icon(
                    Icons.star,
                    size: 16,
                    color: ColorManager.yellowColor,
                  ),
                  SizedBox(width: 4.w),
                  Text('4.9', style: TextStyles.font14BlackColorW400),
                ],
              ),

              SizedBox(height: 6.h),

              Text('Recliner Chair Wood', style: TextStyles.font16BlackW500),

              SizedBox(height: 6.h),

              Row(
                children: [
                  Text('\$105.00', style: TextStyles.font16BlackW500),
                  SizedBox(width: 8.w),
                  Text(
                    '\$150.00',
                    style: TextStyles.font14GreyColorW400.copyWith(
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 6.h),

              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
                style: TextStyles.font14deepGreyColorW400,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),

              SizedBox(height: 12.h),

              CustomButtonWidget(
                buttonText: 'Shop Now →',
                onPressed: () {
                  GoRouter.of(context).push(AppRouter.filtersScreen);
                },
                backgroundColor: ColorManager.thirdColor,
                textColor: Colors.white,
                height: 48.h,
                minWidth: 140.w,
                raduis: 15,
              ),
            ],
          ),
        ),

        SizedBox(width: 14.w),

        /// ================= IMAGE CARD =================
        Image.asset(height: 170.h, width: 150.w, image),
        /*Stack(
          children: [
            Container(
              height: 170.h,
              width: 150.w,
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(
                color: ColorManager.soLightGreyColor,
                borderRadius: BorderRadius.circular(15.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    blurRadius: 18,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Image.asset(image, fit: BoxFit.contain),
            ),

            /// ===== OFF BADGE =====
            Positioned(
              top: 12.h,
              left: 12.w,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                decoration: BoxDecoration(
                  color: ColorManager.primaryColor,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Text(
                  '30% Off',
                  style: TextStyles.font12GreyColorW400.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),*/
      ],
    );
  }
}
