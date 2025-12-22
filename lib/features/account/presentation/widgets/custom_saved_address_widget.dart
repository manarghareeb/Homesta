import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/theming/styles.dart';

class SavedAddressWidget extends StatelessWidget {
  const SavedAddressWidget({
    super.key,
    required this.name,
    required this.address,
    this.onEdit,
    this.onDelete,
  });

  final String name;
  final String address;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: const Color(0xFFF6F6F6),
        border: Border.all(color: ColorManager.lightGreyColor),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: TextStyles.font16BlackW500),
                SizedBox(height: 4.h),
                Text(address, style: TextStyles.font14GreyColorW400),
              ],
            ),
          ),
          IconButton(
            icon: Icon(Icons.edit, color: ColorManager.primaryColor),
            onPressed: onEdit,
          ),
          IconButton(
            icon: Icon(Icons.delete, color: Colors.red),
            onPressed: onDelete,
          ),
        ],
      ),
    );
  }
}
