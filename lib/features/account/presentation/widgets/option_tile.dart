import 'package:flutter/material.dart';
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
    return Card(
      color: Colors.white,
      elevation: 0,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: ColorManager.mainColor,
          child: Icon(icon, color: ColorManager.blackColor),
        ),
        title: Text(
          label,
          style: TextStyles.font16BlackRegular
        ),
        onTap: onTap,
      ),
    );
  }
}
