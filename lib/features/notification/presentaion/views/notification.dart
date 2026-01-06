import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/core/widgets/custom_app_bar_widget.dart';
import '../../../../core/theming/styles.dart';
import '../widgets/notification_item.dart';
import 'notification_empty_screen.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  final List<String> newNotifications = const [
    'Your order #2381 has been shipped.',
    'Payment completed successfully for your order.',
    'Payment completed successfully for your order.',
    'Special Offer! 20% off on kitchen essentials today.',
    'Still thinking? Items in your cart might sell out soon.',
  ];

  final List<String> oldNotifications = const [
    'How was your last purchase? Share your feedback.',
    'Recommended for you: New furniture collections just arrived.',
    'Recommended for you: New furniture collections just arrived.',
    'New arrivals in home appliances. Check them out!',
  ];

  @override
  Widget build(BuildContext context) {
    final bool hasNew = newNotifications.isNotEmpty;
    final bool hasOld = oldNotifications.isNotEmpty;
    final bool hasNotifications = hasNew || hasOld;

    return Scaffold(
      appBar: const CustomAppBarWidget(
        text: 'Notification',
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child:
            hasNotifications
                ? _buildNotificationList(hasNew, hasOld)
                : const NotificationEmptyScreen(),
      ),
    );
  }

  Widget _buildNotificationList(bool hasNew, bool hasOld) {
    return ListView(
      children: [
        if (hasNew) ...[
          Text('New Notifications', style: TextStyles.font20BlackColorW500),
          SizedBox(height: 12.h),
          ...newNotifications
              .map((text) => NotificationItem(text: text, isNew: true))
              .toList(),
          SizedBox(height: 24.h),
        ],
        if (hasOld) ...[
          Text('Older Notifications', style: TextStyles.font20BlackColorW500),
          SizedBox(height: 12.h),
          ...oldNotifications
              .map((text) => NotificationItem(text: text, isNew: false))
              .toList(),
        ],
      ],
    );
  }
}
