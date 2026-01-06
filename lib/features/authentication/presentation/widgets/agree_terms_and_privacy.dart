import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homesta/core/theming/styles.dart';

class AgreeTermsAndPrivacy extends StatelessWidget {
  const AgreeTermsAndPrivacy({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Wrap(
        alignment: WrapAlignment.start,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Text('Agree with ', style: TextStyles.font14GreyColorW400),
          InkWell(
            onTap: () {},
            child: Text(
              'Terms & Conditions ',
              style: TextStyles.font16PrimaryColorW400Underline.copyWith(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Text('and ', style: TextStyles.font14GreyColorW400),
          InkWell(
            onTap: () {},
            child: Text(
              'Privacy Policy',
              style: TextStyles.font16PrimaryColorW400Underline.copyWith(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
