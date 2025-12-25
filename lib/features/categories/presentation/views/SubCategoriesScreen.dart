import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/theming/styles.dart';
import '../widgets/SubCategoryItem.dart';

class SubCategoriesScreen extends StatelessWidget {
  final String categoryName;

  const SubCategoriesScreen({super.key, required this.categoryName});

  List<Map<String, String>> getSubCategories() {
    switch (categoryName) {
      case 'Electrical Appliances':
        return [
          {'title': 'Washing Machine', 'image': 'assets/images/chair.png'},
          {'title': 'Refrigerator', 'image': 'assets/images/chair.png'},
          {'title': 'Microwave', 'image': 'assets/images/chair.png'},
        ];

      case 'Bedrooms':
        return [
          {'title': 'Bed', 'image': 'assets/images/chair.png'},
          {'title': 'Wardrobe', 'image': 'assets/images/chair.png'},
          {'title': 'Night Stand', 'image': 'assets/images/chair.png'},
        ];

      case 'Living Room':
        return [
          {'title': 'Chair', 'image': 'assets/images/chair.png'},
          {'title': 'Sofa', 'image': 'assets/images/chair.png'},
        ];

      default:
        return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    final subCategories = getSubCategories();

    return Scaffold(
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
              height: 48.h,
              padding: EdgeInsets.symmetric(horizontal: 14.w),
              decoration: BoxDecoration(
                color: ColorManager.lightGreyIconColor,
                borderRadius: BorderRadius.circular(14.r),
              ),
              child: Row(
                children: [
                  const Icon(Icons.search, color: ColorManager.lightGreyColor),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search',
                        border: InputBorder.none,
                        hintStyle: TextStyles.font14GreyColorW400,
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.camera_alt_outlined,
                    color: ColorManager.lightGreyColor,
                  ),
                  const Icon(
                    Icons.mic_none,
                    color: ColorManager.lightGreyColor,
                  ),
                ],
              ),
            ),

            SizedBox(height: 16.h),

            Expanded(
              child: ListView.separated(
                itemCount: subCategories.length,
                separatorBuilder:
                    (_, __) => Divider(color: Colors.grey.shade300),
                itemBuilder: (context, index) {
                  final item = subCategories[index];
                  return SubCategoryItem(
                    title: item['title']!,
                    image: item['image']!,
                    onTap: () {
                      GoRouter.of(context).push(
                        '/categorySection/'
                        '${Uri.encodeComponent(categoryName)}/'
                        '${Uri.encodeComponent(item['title']!)}',
                      );
                    },
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
