import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/widgets/custom_button_widget.dart';

class SupportOptionWidget extends StatelessWidget {
  final String title;
  final String description;
  final String buttonText;
  final Color color;
  final String? imagePath;
  final IconData? icon;

  const SupportOptionWidget({
    super.key,
    required this.title,
    required this.description,
    required this.buttonText,
    required this.color,
    this.imagePath,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      child: Padding(
        padding: EdgeInsets.all(12.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                Container(
                  width: 40.w,
                  height: 40.w,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: _buildIconOrImage(), // ✅ هنا نعرض إما أيقونة أو صورة
                ),
                SizedBox(height: 8.h),
                Text(title, style: TextStyles.font16BlackW500),
              ],
            ),
            SizedBox(height: 6.h),
            Text(description, style: TextStyles.font14GreyColorW400, textAlign: TextAlign.center),
            SizedBox(height: 8.h),
            Align(
              alignment: Alignment.center,
              child: CustomButtonWidget(
                buttonText: buttonText,
                onPressed: () {},
                isPrimary: false,
                backgroundColor: Colors.white,
                textColor: Colors.black,
                minWidth: 150.w,
              ),
            )
          ],
        ),
      ),
    );
  }


  Widget _buildIconOrImage() {
    if (icon != null) {
      return Icon(icon, size: 24.sp, color: Colors.black);
    } else if (imagePath != null) {
      return Image.asset(
        imagePath!,
        width: 20.w,
        height: 20.w,
        fit: BoxFit.contain,
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
