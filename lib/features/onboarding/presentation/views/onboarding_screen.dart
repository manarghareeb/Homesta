import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:homesta/core/routing/app_router.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/theming/styles.dart';
import 'package:homesta/core/widgets/custom_button_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController controller = PageController();
  int index = 0;
  bool isLastPage = false;

  final List<Map<String, String>> pages = [
    {
      'image': 'assets/images/image 1.png',
      'text': '“EveryThing your home needs – In one place”',
    },
    {
      'image': 'assets/images/image 2.png',
      'text': '“Kitchen, Furniture, Electronics – All in Homesta”',
    },
    {
      'image': 'assets/images/image 3.png',
      'text': '“Easy Shopping for every corner of your home”',
    },
    {
      'image': 'assets/images/image 4.png',
      'text': '“Your Home From A–Z IN Homesta”',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.mainColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 16.w),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  index > 0
                      ? IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios_new_rounded,
                          color: Color(0xFF43766C),
                          size: 15.sp,
                        ),
                        onPressed: () {
                          controller.previousPage(
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.easeInOut,
                          );
                        },
                      )
                      : SizedBox(width: 48.w),
                  TextButton(
                    onPressed: () {
                      GoRouter.of(context).push(AppRouter.loginScreen);
                    },
                    child: Text(
                      'Skip',
                      style: TextStyle(
                        fontSize: 18.sp,
                        color: ColorManager.blackColor,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: PageView.builder(
                  controller: controller,
                  itemCount: pages.length,
                  onPageChanged: (pageIndex) {
                    setState(() {
                      index = pageIndex;
                      isLastPage = pageIndex == pages.length - 1;
                    });
                  },
                  itemBuilder: (context, index) {
                    final page = pages[index];
                    return Column(
                      children: [
                        SizedBox(height: 10.h),
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.r),
                            child: Image.asset(
                              page['image']!,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(height: 20.h),
                        SmoothPageIndicator(
                          controller: controller,
                          count: pages.length,
                          effect: ScaleEffect(
                            activeDotColor: ColorManager.buttonColor,
                            dotColor: ColorManager.secondColor,
                            dotHeight: 8.h,
                            dotWidth: 8.w,
                          ),
                        ),
                        SizedBox(height: 50.h),
                        Text(
                          page['text']!,
                          textAlign: TextAlign.center,
                          style: TextStyles.font18BlackW500,
                        ),
                        SizedBox(height: 70.h),
                        CustomButtonWidget(
                          buttonText: isLastPage ? 'Get Started' : 'Next', 
                          onPressed: () {
                              if (isLastPage) {
                                GoRouter.of(
                                  context,
                                ).push(AppRouter.loginScreen);
                              } else {
                                controller.nextPage(
                                  duration: const Duration(milliseconds: 400),
                                  curve: Curves.easeInOut,
                                );
                              }
                            },
                        ),
                        SizedBox(height: 20.h),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
