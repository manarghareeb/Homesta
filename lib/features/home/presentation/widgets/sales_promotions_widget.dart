import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/core/theming/colors.dart';
import '../../../../core/widgets/custom_button_widget.dart';

class SalesPromotionsWidget extends StatelessWidget {
  const SalesPromotionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Sales & Promotions',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        SizedBox(height: 12.h),

        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: Container(
                padding: EdgeInsets.all(15.w),
                decoration: BoxDecoration(
                  color: ColorManager.soLightGreyColor,
                  borderRadius: BorderRadius.circular(15.r),
                ),
                child: Row(
                  children: [
                    /// TEXT
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'New Collection',
                                style: TextStyle(
                                  fontWeight: FontWeight.w100,
                                  color: ColorManager.primaryColor,
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(height: 6.h),
                              _badge('1500+ Items'),
                              SizedBox(height: 8.h),
                              const Text(
                                '-UP TO-',
                                style: TextStyle(fontSize: 12),
                              ),
                              SizedBox(height: 10),
                              const Text(
                                '40% Off',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: ColorManager.primaryColor,
                                ),
                              ),
                            ],
                          ),

                          CustomButtonWidget(
                            buttonText: 'Buy Now',
                            onPressed: () {},
                            backgroundColor: ColorManager.primaryColor,
                            textColor: Colors.white,
                            minWidth: 80.w,
                            raduis: 15,
                            height: 10.h,
                          ),
                        ],
                      ),
                    ),

                    Image.asset(
                      'assets/images/sales_and_promotions_image/Frame 1984080150.png',
                      width: 60.w,
                      fit: BoxFit.contain,
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(width: 12.w),

            Expanded(
              flex: 2,
              child: Column(
                children: [
                  _smallPromoCard(
                    title: '750+ Items',
                    subtitle: 'Free Delivery\nOn Order Above \$300',
                    image: 'assets/images/sales_and_promotions_image/Frame 1984080148.png',
                  ),
                  SizedBox(height: 6.h),
                  _smallPromoCard(
                    title: '450+ Items',
                    subtitle: 'Buy 1 Get 1 Free',
                    image: 'assets/images/sales_and_promotions_image/Frame 1984080149.png',
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _badge(String text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Text(text, style: const TextStyle(fontSize: 12)),
    );
  }

  Widget _smallPromoCard({
    required String title,
    required String subtitle,
    required String image,
  }) {
    return Container(
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        color: ColorManager.soLightGreyColor,
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _badge(title),
                SizedBox(height: 6.h),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w100,
                  ),
                ),
              ],
            ),
          ),

          Image.asset(image, width: 30.w, fit: BoxFit.contain),
        ],
      ),
    );
  }
}
