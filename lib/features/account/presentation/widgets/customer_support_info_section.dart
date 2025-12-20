import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:homesta/features/account/presentation/widgets/customer_support_info_item.dart';

class CustomerSupportInfoSection extends StatelessWidget {
  CustomerSupportInfoSection({super.key});
  final List<Map<String, dynamic>> informationItems = [
    {
      'icon': Icons.phone_outlined,
      'text1': 'Call Us',
      'text2': 'Available 24/7',
      'text3': '+123 456 789',
    },
    {
      'icon': Icons.location_on_outlined,
      'text1': 'Visit Us',
      'text2': 'Furniture Showerroom',
      'text3': '8502 Person Rd.',
    },
    {
      'icon': Icons.email_outlined,
      'text1': 'Email Us',
      'text2': 'Reply within 24 hours',
      'text3': 'Support@homesta.com',
    },
    {
      'icon': FontAwesomeIcons.clock,
      'text1': 'Working Hours',
      'text2': 'Sunday - Thursday',
      'text3': '9:00 AM - 6:00 PM',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: informationItems.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 24.h,
        crossAxisSpacing: 24.w,
        //childAspectRatio: 1.2.h,
      ),
      itemBuilder: (context, index) {
        final item = informationItems[index];
        return CustomerSupportInfoItem(
          icon: item['icon'],
          text1: item['text1'],
          text2: item['text2'],
          text3: item['text3'],
        );
      },
    );
  }
}
