import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:homesta/core/routing/app_router.dart';
import 'package:homesta/features/account/presentation/widgets/icon_text_button.dart';

class List extends StatelessWidget {
  const List({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconTextButton(
          icon: Icons.person_outlined,
          label: 'Profile',
          isActive: true,
          onTap: () {},
        ),
        IconTextButton(
          icon: Icons.favorite_border,
          label: 'Wish list',
          onTap: () {},
        ),
        IconTextButton(
          icon: Icons.list_alt,
          label: 'My order',
          onTap: () {
            GoRouter.of(context).push(AppRouter.myOrderScreen);
          },
        ),
      ],
    );
  }
}