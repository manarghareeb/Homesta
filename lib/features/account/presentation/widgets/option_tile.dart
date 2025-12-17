import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/theming/styles.dart';

class OptionTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final Function() onTap;

  const OptionTile({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
            side: BorderSide(
              color: ColorManager.lightGreyColor
            )
          ),
          color: Colors.white,
          elevation: 0,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(icon, color: ColorManager.blackColor),
            ),
            title: Text(label, style: TextStyles.font16BlackRegular),
            trailing: Icon(Icons.arrow_forward_ios, size: 16),
            onTap: onTap,
          ),
        ),
        SizedBox(height: 16,),
      ],
    );
  }
}
