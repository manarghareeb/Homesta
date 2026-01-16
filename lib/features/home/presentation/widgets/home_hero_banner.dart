import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:homesta/core/routing/app_router.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/theming/styles.dart';
import 'package:homesta/core/widgets/custom_button_widget.dart';

class HomeHeroBanner extends StatelessWidget {
  const HomeHeroBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.r),
        child: Stack(
          children: [
            /// Background
            Positioned.fill(
              child: Image.asset(
                'assets/images/catrgories_image/livingroom.png',
                fit: BoxFit.cover,
              ),
            ),

            /// Overlay
            /*Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.black.withOpacity(0.6),
                      Colors.black.withOpacity(0.2),
                    ],
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                  ),
                ),
              ),
            ),*/

            /// Content
            Positioned.fill(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// TEXTS
                    Wrap(
                      spacing: 6,
                      runSpacing: 4,
                      children: const [
                        Text(
                          'Explore Our',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          'Modern',
                          style: TextStyle(
                            color: ColorManager.primaryColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),

                    const Text(
                      'Furniture Collection',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: ColorManager.primaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    const SizedBox(height: 25),

                    /// BUTTONS (Responsive)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: CustomButtonWidget(
                            buttonText: 'Shop Now',
                            onPressed: () {
                              GoRouter.of(context).push(AppRouter.filtersScreen);
                            },
                          ),
                        ),
                        Expanded(
                          child: TextButton(
                              onPressed: () {},
                              child: Text(
                                'View All Product',
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Outfit',
                                  color: ColorManager.whihte,
                                  decoration: TextDecoration.underline,
                                  decorationColor: Colors.white,
                                ),
                              ),
                            ),
                        ),
                      ],
                    ),
                    /*Wrap(
                      spacing: 20.w,
                      runSpacing: 6,
                      children: [
                        SizedBox(
                          height: 40,
                          child: ElevatedButton(
                            onPressed: () {
                              GoRouter.of(
                                context,
                              ).push(AppRouter.filtersScreen);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: ColorManager.primaryColor,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Text(
                              'Shop Now   >',
                              style: TextStyles.font16WhiteW500,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 36,
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              'View All Product',
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Outfit',
                                color: ColorManager.whihte,
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),*/
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
