/*import 'package:flutter/material.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/theming/styles.dart';

class DataAnalytics extends StatelessWidget {
  const DataAnalytics({super.key, required this.title, required this.subTitle});
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 29),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: ColorManager.lightGreyIconColor),
      ),
      child: Column(
        children: [
          Text(title, style: TextStyles.font16GreyRegular),
          SizedBox(height: 8),
          Text(subTitle, style: TextStyles.font20BlackColorW500),
        ],
      ),
    );
  }
}
*/

import 'package:flutter/material.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/theming/styles.dart';

class DataAnalytics extends StatelessWidget {
  const DataAnalytics({
    super.key,
    required this.title,
    required this.subTitle,
    this.titleStyle,
    this.subTitleStyle,
  });
  final String title;
  final String subTitle;
  final TextStyle? titleStyle;
  final TextStyle? subTitleStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 29),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: ColorManager.lightGreyIconColor),
      ),
      child: Column(
        children: [
          Text(title, style: titleStyle ?? TextStyles.font16GreyRegular),
          SizedBox(height: 8),
          Text(
            subTitle,
            style: subTitleStyle ?? TextStyles.font20BlackColorW500,
          ),
        ],
      ),
    );
  }
}
