import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/theming/styles.dart';

class ProductItemCard extends StatelessWidget {
  const ProductItemCard({
    super.key,
    required this.image,
    required this.name,
    required this.price,
    //required this.favorites,
  });

  //final List<bool> favorites;
  final String image;
  final String name;
  final double price;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                borderRadius: BorderRadius.vertical(top: Radius.circular(10.r)),
                child: Image.asset(
                  image,
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
                    /*setState(() {
                      favorites[index] = !favorites[index];
                    });*/
                  },
                  child: CircleAvatar(
                    radius: 16.r,
                    backgroundColor: Colors.white.withOpacity(0.0),
                    child: Icon(
                      //favorites[index]
                      //  ? Icons.favorite :
                      Icons.favorite_border,
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
                      child: Icon(Icons.add, color: Colors.white, size: 20.sp),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyles.font18BlackW500.copyWith(fontSize: 12.sp),
                ),
                SizedBox(height: 4.h),
                Text(
                  '$price\$',
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
    );
  }
}
