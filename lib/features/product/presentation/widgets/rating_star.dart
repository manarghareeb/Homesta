import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RatingStar extends StatelessWidget {
  const RatingStar({super.key, required this.rating});
final double rating ;
  @override
  Widget build(BuildContext context) {
    return               Row(
                  children: List.generate(5, (index) {
                    IconData icon;
                    Color color;

                    if (index < rating.floor()) {
                      // نجوم كاملة
                      icon = Icons.star;
                      color = Colors.amber;
                    } else if (index < rating && (rating - index) > 0) {
                      // نجمة نصف ممتلئة (للأرقام الكسرية مثل .5 أو .8)
                      icon = Icons.star_half;
                      color = Colors.amber;
                    } else {
                      // نجوم فارغة
                      icon = Icons.star_border;
                      color = Colors.grey[300]!;
                    }

                    return Icon(icon, color: color, size: 24.sp);
                  }),
                );
  }
}