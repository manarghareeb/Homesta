import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/core/di/service_locator.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/theming/styles.dart';
import 'package:homesta/features/categories/presentation/cubits/sub_category_cubit.dart/sub_category_cubit.dart';
import 'package:homesta/features/categories/presentation/widgets/sub_category_bloc_builder.dart';

class SubCategoriesScreen extends StatelessWidget {
  final int id;

  const SubCategoriesScreen({super.key, required this.id});

  // List<Map<String, String>> getSubCategories() {
  //   switch (categoryName) {
  //     case 'Electrical Appliances':
  //       return [
  //         {'title': 'Washing Machine', 'image': 'assets/images/chair.png'},
  //         {'title': 'Refrigerator', 'image': 'assets/images/chair.png'},
  //         {'title': 'Microwave', 'image': 'assets/images/chair.png'},
  //       ];

  //     case 'Bedrooms':
  //       return [
  //         {'title': 'Bed', 'image': 'assets/images/chair.png'},
  //         {'title': 'Wardrobe', 'image': 'assets/images/chair.png'},
  //         {'title': 'Night Stand', 'image': 'assets/images/chair.png'},
  //       ];

  //     case 'Living Room':
  //       return [
  //         {'title': 'Chair', 'image': 'assets/images/chair.png'},
  //         {'title': 'Sofa', 'image': 'assets/images/chair.png'},
  //       ];

  //     default:
  //       return [];
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<SubCategoryCubit>()..getSubCategories(id),
      child: Scaffold(
        backgroundColor: Colors.white,

        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text('Sub-Categories', style: TextStyles.font16BlackW500),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          ),
        ),

        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              Container(
                height: 50.h,
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                decoration: BoxDecoration(
                  color: ColorManager.soLightGreyColor,
                  borderRadius: BorderRadius.circular(15.r),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.search,
                      color: ColorManager.lightGreyColor,
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: TextField(
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(
                          hintText: 'Search',
                          border: InputBorder.none,
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(vertical: 14.h),
                          hintStyle: TextStyles.font14GreyColorW400,
                        ),
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Container(
                      padding: EdgeInsets.all(8.w),
                      child: const Icon(
                        Icons.camera_alt_outlined,
                        color: ColorManager.lightGreyColor,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    const Icon(
                      Icons.mic_none,
                      color: ColorManager.lightGreyColor,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.h),

              SubCategoryBlocBuilder(),
            ],
          ),
        ),
      ),
    );
  }
}
