import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/widgets/custom_button_widget.dart';

class SupportOptionWidget extends StatelessWidget {
  final String title;
  final String description;
  final String buttonText;
  final Color color;
  final String imagePath;

  const SupportOptionWidget({
    super.key,
    required this.title,
    required this.description,
    required this.buttonText,
    required this.color,
    required this.imagePath,
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
                Image.asset( imagePath, width: 30.w, height: 30.w, fit: BoxFit.contain, ),
                SizedBox(width: 8.w),
                Text(title, style: TextStyles.font16BlackW500),
              ],
            ),
            SizedBox(height: 6.h),
            Text(description, style: TextStyles.font14GreyColorW400),
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
}
