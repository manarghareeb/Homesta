import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/core/widgets/custom_button_widget.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/widgets/custom_app_bar_widget.dart';
import '../widgets/conant_row_card.dart';
import '../widgets/rating_card.dart';

class SellerProfileScreen extends StatelessWidget {
  final String sellerName;

  const SellerProfileScreen({super.key, required this.sellerName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBarWidget(text: "Seller $sellerName"),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Header Section
            Card(
              color: Color(0xffF6F6F6),
              child: Padding(
                padding: EdgeInsets.all(14.w),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(width: 12.w),
                    CircleAvatar(
                      radius: 40.r,
                      backgroundImage: AssetImage(
                        "assets/images/onboarding_image/onboarding1.png",
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(16.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "⭐ 3.1 (1500 Reviews)",
                              style: TextStyles.font15BlackW400,
                            ),
                            SizedBox(height: 8.h),
                            CustomButtonWidget(
                              onPressed: () {},
                              buttonText: 'Book Now',
                              minWidth: 150.w,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 24.h),

            /// Contact Information
            Card(
              color: const Color(0xffF6F6F6),
              child: Padding(
                padding: EdgeInsets.all(12.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    ContactRowWidget(
                      icon: Icons.phone_outlined,
                      text: "+20 100 456 1986",
                    ),
                    SizedBox(height: 8),
                    ContactRowWidget(
                      imagePath: "assets/images/seller_image_icon/whatsapp.png",
                      text: "WhatsApp Available",
                    ),
                    SizedBox(height: 8),
                    ContactRowWidget(
                      icon: Icons.email_outlined,
                      text: "sellername@gmail.com",
                    ),
                    SizedBox(height: 8),
                    ContactRowWidget(
                      icon: Icons.location_on_outlined,
                      text: "Al-Nasr Street, Mohandessin District, Giza",
                    ),
                    SizedBox(height: 8),
                    ContactRowWidget(
                      icon: Icons.access_time,
                      text: "01:00 PM – 10:00 PM",
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 24.h),

            /// About Seller
            Card(
              color: Color(0xffF6F6F6),
              child: Padding(
                padding: EdgeInsets.all(12.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "About the Seller",
                      style: TextStyles.font20BlackColorW500,
                    ),
                    SizedBox(height: 12.h),
                    Text(
                      "Skilled service provider with hands‑on experience delivering reliable and high‑quality services. Trusted by many customers for professionalism and on‑time work.",
                      style: TextStyles.font15BlackW400,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 24.h),

            /// Rating
            const RatingBreakdownCard(),
            SizedBox(height: 24.h),

            /// Services
            Card(
              color: Color(0xffF6F6F6),
              child: Padding(
                padding: EdgeInsets.all(20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Services", style: TextStyles.font20BlackColorW500),
                    SizedBox(height: 12.h),
                    Card(
                      color: Color(0xffF6F6F6),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                        side: const BorderSide(
                          color: Color(0xFFB3B3B3), // Tan color
                          width: 1, // سمك البورد
                        ),
                      ),
                      child: ListTile(
                        title: const Text("Service Name"),
                        subtitle: const Text("⭐ 4  \nStarting from \$20"),
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Card(
                      color: Color(0xffF6F6F6),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                        side: const BorderSide(
                          color: Color(0xFFB3B3B3), // Tan color
                          width: 1, // سمك البورد
                        ),
                      ),
                      child: ListTile(
                        title: const Text("Service Name"),
                        subtitle: const Text("⭐ 4.2 \nStarting from \$20"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 24.h),

            /// Additional Info
            Card(
              color: Color(0xffF6F6F6),
              child: Padding(
                padding: EdgeInsets.all(12.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Additional Info",
                      style: TextStyles.font20BlackColorW500,
                    ),
                    SizedBox(height: 12.h),
                    ContactRowWidget(
                      icon: Icons.calendar_today_outlined,
                      text: "Years of Experience \n5+ Years",
                    ),
                    SizedBox(height: 8.h),
                    ContactRowWidget(
                      icon: Icons.shopping_bag_outlined,
                      text: "Completed Jobs \n320+",
                    ),
                    SizedBox(height: 8.h),
                    ContactRowWidget(
                      icon: Icons.location_on_outlined,
                      text: "Service Area \nGiza & Cairo",
                    ),
                    SizedBox(height: 8.h),
                    ContactRowWidget(
                      icon: Icons.access_time,
                      text: "Response Time \nWithin 1 Hour",
                    ),
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
