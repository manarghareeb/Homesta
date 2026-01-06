import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:homesta/core/routing/app_router.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/theming/styles.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../core/widgets/custom_button_widget.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController controller = PageController();
  int index = 0;

  final List<Map<String, String>> pages = [
    {
      'image': 'assets/images/onboarding_image/onboarding1.png',
      'title': 'Build your unique dining room look',
      'subtitle':
          'Personlize your room the way you want. Now\n eat at a table that is both stylish and well fit\n with your way.',
      'button': 'Skip →',
    },
    {
      'image': 'assets/images/onboarding_image/onboarding2.png',
      'title': 'Weave your own kind of living room',
      'subtitle':
          'Add different colors to your personal space. Try\n exotic furnitures and play with the color pallet\n create your style !',
      'button': 'Skip →',
    },
    {
      'image': 'assets/images/onboarding_image/onboarding3.png',
      'title': 'Try aesthetics, bring\n light to your place',
      'subtitle':
          'Feel like having an aesthetic vibe? Do not just think, add\n your favourite, compare items with your wishlist and\n add magic to that vibe to your life.',
      'button': 'Explore →',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: controller,
                itemCount: pages.length,
                onPageChanged: (pageIndex) {
                  setState(() {
                    index = pageIndex;
                  });
                },
                itemBuilder: (context, index) {
                  final page = pages[index];
                  return Padding(
                    padding: EdgeInsets.only(bottom: 16.w),
                    child: Column(
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(240.r),
                            ),
                            child: Image.asset(
                              page['image']!,
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          ),
                        ),
                        SizedBox(height: 20.h),
                        Column(
                          children: [
                            Text(
                              page['title']!,
                              textAlign: TextAlign.center,
                              style: TextStyles.font18BlackW500,
                            ),
                            SizedBox(height: 12.h),
                            Text(
                              page['subtitle']!,
                              textAlign: TextAlign.center,
                              style: TextStyles.font13BlackColorW400,
                            ),
                          ],
                        ),
                        SizedBox(height: 30.h),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SmoothPageIndicator(
                                controller: controller,
                                count: pages.length,
                                effect: ScaleEffect(
                                  activeDotColor: ColorManager.primaryColor,
                                  dotColor: ColorManager.lightGreyColor,
                                  dotHeight: 8.h,
                                  dotWidth: 8.w,
                                ),
                              ),
                              pages[index]['button'] == 'Explore →'
                                  ? SizedBox(
                                    width: 120.w,
                                    child: CustomButtonWidget(
                                      buttonText: pages[index]['button']!,
                                      onPressed: () {
                                        GoRouter.of(
                                          context,
                                        ).push(AppRouter.loginScreen);
                                      },
                                      isPrimary: true,
                                    ),
                                  )
                                  : TextButton(
                                    onPressed: () {
                                      controller.nextPage(
                                        duration: const Duration(
                                          milliseconds: 400,
                                        ),
                                        curve: Curves.easeInOut,
                                      );
                                    },
                                    child: Text(
                                      pages[index]['button']!,
                                      style: TextStyles.font18BlackW500,
                                    ),
                                  ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
