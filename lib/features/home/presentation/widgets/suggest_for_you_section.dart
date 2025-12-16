import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/theming/styles.dart';

class SuggestForYouSection extends StatefulWidget {
  const SuggestForYouSection({super.key});

  @override
  State<SuggestForYouSection> createState() => _SuggestForYouSectionState();
}

class _SuggestForYouSectionState extends State<SuggestForYouSection> {
  final List<bool> favorites = List.generate(10, (_) => false);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Stack(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                width: 160.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Image.asset(
                        'assets/images/chair.png',
                        height: 90.h,
                        width: 140.w,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Divider(color: ColorManager.thirdColor),
                    SizedBox(height: 8.h),
                    Text(
                      'Modern Chair',
                      style: TextStyles.font13BlackW500,
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      '\$120',
                      style: TextStyles.font13BlackW500.copyWith(
                        color: ColorManager.thirdColor,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 8.h,
                right: 4.w,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      favorites[index] = !favorites[index];
                    });
                  },
                  child: CircleAvatar(
                    radius: 16.r,
                    backgroundColor: ColorManager.soLightGreyColor,
                    child: Icon(
                      favorites[index] ? Icons.favorite : Icons.favorite_border,
                      color: ColorManager.primaryColor,
                      size: 18.sp,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
        separatorBuilder: (context, index) => SizedBox(width: 16.w),
        itemCount: 4,
      ),
    );
  }
}
