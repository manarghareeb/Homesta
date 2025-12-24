import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/theming/styles.dart';

class OptionTile extends StatelessWidget {
  final IconData? icon;            // الأيقونة اختيارية
  final String? imagePath;         // الصورة اختيارية
  final String label;              // النص الأساسي (أسود) إجباري
  final String? subtitle;          // النص الفرعي (رمادي) اختياري
  final Function() onTap;
  final Widget? trailing;
  final Color? backgroundColor;
  final Color? colorBorder;
  // لون الخلفية اختياري

  const OptionTile({
    super.key,
    this.icon,
    this.imagePath,
    required this.label,
    this.subtitle,
    required this.onTap,
    this.trailing,
    this.backgroundColor,
    this.colorBorder
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
            side: BorderSide(color: colorBorder ?? ColorManager.soLightGreyColor),
          ),
          color: backgroundColor ?? ColorManager.soLightGreyColor,
          elevation: 0,
          child: ListTile(
            leading: _buildLeading(),
            title: Text(label, style: TextStyles.font16BlackRegular),
            subtitle: subtitle != null
                ? Text(subtitle!, style: TextStyles.font14GreyColorW400)
                : null,
            trailing: trailing ?? Icon(Icons.arrow_forward_ios, size: 16),
            onTap: onTap,
          ),
        ),
        SizedBox(height: 16),
      ],
    );
  }

  /// يبني الـ leading حسب إذا فيه صورة أو أيقونة
  Widget _buildLeading() {
    if (imagePath != null) {
      return CircleAvatar(
        backgroundColor:Color(0xffF6F6F6),
        child: Image.asset(
          imagePath!,
          width: 20.w,
          height: 20.w,
          fit: BoxFit.contain,
        ),
      );
    } else if (icon != null) {
      return CircleAvatar(
        backgroundColor: Colors.white,
        child: Icon(icon, color: ColorManager.blackColor),
      );
    } else {
      return const SizedBox.shrink(); // إذا ما فيه لا صورة ولا أيقونة
    }
  }
}
