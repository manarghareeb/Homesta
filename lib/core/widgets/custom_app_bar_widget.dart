import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/theming/styles.dart';

class CustomAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomAppBarWidget({
    super.key,
    required this.text,
    this.actions,
    this.backgroundColor = Colors.white,
  });
  final String text;
  final List<Widget>? actions;
  final Color backgroundColor;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: backgroundColor,
      backgroundColor: backgroundColor,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
          size: 16,
          color: ColorManager.blackColor,
        ),
        onPressed: () {
          GoRouter.of(context).pop();
        },
      ),
      title: Text(
        text,
        style: TextStyles.font20BlackColorW500,
      ),
      centerTitle: true,
      actions: actions,
    );
  }
}
