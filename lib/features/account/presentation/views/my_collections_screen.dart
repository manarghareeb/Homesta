import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/widgets/custom_app_bar_widget.dart';
import '../widgets/collections_card_widget.dart';

class CollectionsScreen extends StatelessWidget {
  const CollectionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBarWidget(text: "Collections"),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Explore and save your favorite \ndestinations here.",
              style: TextStyles.font14BlackColorW400,
            ),
            SizedBox(height: 16.h),

            //create new collection
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.add, color: Colors.black),
              label: Text(
                "Create a list",
                style: TextStyles.font16BlackRegular,
              ),
              style: ElevatedButton.styleFrom(
                textStyle: TextStyles.font16GreyRegular,
                backgroundColor: Colors.white,
                minimumSize: Size(double.infinity, 48.h),
                side: const BorderSide(color: Colors.black, width: 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
            ),
            SizedBox(height: 24.h),

            Expanded(
              child: ListView(
                children: const [
                  CollectionCard(
                    title: "Kitchen",
                    savedCount: 4,
                    thumbnails: [
                      "assets/images/image 1.png",
                      "assets/images/image 1.png",
                      "assets/images/image 1.png",
                      "assets/images/image 1.png",
                    ],
                  ),
                  CollectionCard(
                    title: "My Rooms",
                    savedCount: 6,
                    thumbnails: [
                      "assets/images/image 1.png",
                      "assets/images/image 1.png",
                      "assets/images/image 1.png",
                      "assets/images/image 1.png",
                    ],
                  ),
                  CollectionCard(
                    title: "Bathroom",
                    savedCount: 1,
                    thumbnails: ["assets/images/image 1.png"],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
