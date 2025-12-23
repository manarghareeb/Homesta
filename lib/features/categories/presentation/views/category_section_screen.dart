import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:homesta/core/routing/app_router.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/theming/styles.dart';
import 'package:homesta/core/widgets/custom_app_bar_widget.dart';

class CategorySectionScreen extends StatefulWidget {
  const CategorySectionScreen({super.key, required this.title});
  final String title;

  @override
  State<CategorySectionScreen> createState() => _CategorySectionScreenState();
}

class _CategorySectionScreenState extends State<CategorySectionScreen> {
  final List<bool> favorites = List.generate(10, (_) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.soLightGreyColor,
      appBar: CustomAppBarWidget(
        backgroundColor: ColorManager.soLightGreyColor,
        text: widget.title,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
        child: GridView.builder(
          itemCount: 10,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 24.h,
            crossAxisSpacing: 24.w,
            //childAspectRatio: 1.3.h,
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                GoRouter.of(context).push(AppRouter.orderFlowScreen);
              },
              child: GestureDetector(
                onTap: () {
                  GoRouter.of(context).push(AppRouter.productDetailsScreen);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(10.r),
                            ),
                            child: Image.asset(
                              'assets/images/image 1.png',
                              width: double.infinity,
                              height: 120.h,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            top: 8.h,
                            right: 8.w,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  favorites[index] = !favorites[index];
                                });
                              },
                              child: CircleAvatar(
                                radius: 16.r,
                                backgroundColor: Colors.white.withOpacity(0.0),
                                child: Icon(
                                  favorites[index]
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: ColorManager.thirdColor,
                                  size: 18.sp,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: -12.h,
                            right: 8.w,
                            child: GestureDetector(
                              onTap: () {},
                              child: Container(
                                padding: EdgeInsets.all(1.5.w),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                ),
                                child: CircleAvatar(
                                  radius: 18.r,
                                  backgroundColor: ColorManager.thirdColor,
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                    size: 20.sp,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8.h),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8.w,
                          vertical: 6.h,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Serving Boards',
                              style: TextStyles.font18BlackW500.copyWith(
                                fontSize: 12.sp,
                              ),
                            ),
                            SizedBox(height: 4.h),
                            Text(
                              '40.00\$',
                              style: TextStyles.font12GreyColorW400.copyWith(
                                color: ColorManager.thirdColor,
                                fontSize: 12.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
