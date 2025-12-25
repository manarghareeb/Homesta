import 'package:flutter/material.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/theming/styles.dart';

class TapBarWidget extends StatelessWidget {
  const TapBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  TabBar(
      indicatorColor: ColorManager.primaryColor,
      labelColor: ColorManager.primaryColor,
      unselectedLabelColor: ColorManager.greyColor,
      labelStyle: TextStyles.font15BlackW500.copyWith(color: ColorManager.primaryColor,fontSize: 14),
      dividerHeight: 1,
      dividerColor: ColorManager.greyColor,

      indicatorWeight: 3,
      tabs: const [
        Tab(text: 'Description',),
        Tab(text: 'Addtional infomation'),
        Tab(text: 'Review'),
      ],
    );
  }
}