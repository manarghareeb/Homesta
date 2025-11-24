import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/core/theming/styles.dart';

class CustomAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomAppBarWidget({super.key, required this.text,this.actions});
  final String text;
  final List<Widget>? actions;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: Colors.white,
      backgroundColor: Colors.white,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
          size: 16,
          color: ColorManager.greyColor,
        ),
        onPressed: () {
          GoRouter.of(context).pop();
        },
      ),
      title: Text(
        text,
        style: TextStyles.font24ButtonColorW500.copyWith(fontSize: 20),
      ),
      centerTitle: true,
      actions: actions,
    );
  }
}
