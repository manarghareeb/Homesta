import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/core/theming/colors.dart';

class NotificationItem extends StatelessWidget {
  final String text;
  final bool isNew;

  const NotificationItem({super.key, required this.text, required this.isNew});

  /// دالة لتحديد الأيقونة حسب النص
  IconData _getNotificationIcon(String text) {
    if (text.contains('order') || text.contains('shipped')) {
      return Icons.local_shipping_outlined;
    } else if (text.contains('Payment')) {
      return Icons.payment_outlined;
    } else if (text.contains('Offer') || text.contains('discount')) {
      return Icons.local_offer_outlined;
    } else if (text.contains('cart')) {
      return Icons.shopping_cart_outlined;
    } else if (text.contains('feedback')) {
      return Icons.rate_review_outlined;
    } else {
      return Icons.notifications_outlined;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.h),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: isNew ? const Color(0xFFF0F3FF) : Color(0xFFF6F6F6),
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
        border: Border.all(color: ColorManager.lightGreyColor, width: 0.5),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 36.w,
            height: 36.w,
            decoration: BoxDecoration(
              color: isNew ? ColorManager.primaryColor : Colors.grey,
              shape: BoxShape.circle,
            ),
            child: Icon(
              _getNotificationIcon(text),
              color: Colors.white,
              size: 20.sp,
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: isNew ? Colors.black : Colors.grey[700],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
