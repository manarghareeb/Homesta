import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/theming/styles.dart';

class SaveAndDiscardButtons extends StatelessWidget {
  const SaveAndDiscardButtons({
    super.key,
    required this.saveOnPressed,
    required this.discardOnPressed,
  });
  final void Function() saveOnPressed;
  final void Function() discardOnPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: saveOnPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorManager.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
            ),
            child: Text('Save', style: TextStyles.font14WhiteColorW400),
          ),
        ),
        SizedBox(width: 16.w),
        Expanded(
          child: ElevatedButton(
            onPressed: discardOnPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorManager.lightGreyIconColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
            ),
            child: Text('Discard', style: TextStyle(color: Colors.black)),
          ),
        ),
      ],
    );
  }
}
