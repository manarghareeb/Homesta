import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/core/theming/colors.dart';
import '../../../../core/widgets/custom_button_widget.dart';

class DealsOfDayWidget extends StatelessWidget {
  const DealsOfDayWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Deals of the Day',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        SizedBox(height: 12.h),

        _dealCard(image: 'assets/images/chair.png'),
        SizedBox(height: 16.h),
        _dealCard(image: 'assets/images/chair.png'),
      ],
    );
  }

  Widget _dealCard({required String image}) {
    return Container(
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.r),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 15),
        ],
      ),
      child: Row(
        children: [
          /// ================= INFO =================
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Chair', style: TextStyle(color: Colors.grey)),

                SizedBox(height: 4.h),

                Row(
                  children: const [
                    Icon(Icons.star, color: Colors.amber, size: 16),
                    SizedBox(width: 4),
                    Text('4.9'),
                  ],
                ),

                SizedBox(height: 6.h),

                const Text(
                  'Recliner Chair Wood',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),

                SizedBox(height: 6.h),

                Row(
                  children: const [
                    Text(
                      '\$105.00',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 6),
                    Text(
                      '\$150.00',
                      style: TextStyle(
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 6.h),

                const Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),

                SizedBox(height: 12.h),

                CustomButtonWidget(
                  buttonText: 'Shop Now →',
                  onPressed: () {},
                  backgroundColor: ColorManager.thirdColor,
                  textColor: Colors.white,
                  height: 58.h,
                  minWidth: 130.w,
                  raduis: 15,
                ),
              ],
            ),
          ),

          SizedBox(width: 12.w),

          Stack(
            children: [
              Image.asset(image, height: 120.h, fit: BoxFit.contain),

              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 4.h,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xff2F5D62),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: const Text(
                    '30% Off',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
