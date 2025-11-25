import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:homesta/core/theming/colors.dart';

import '../../../../core/routing/app_router.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      selectedItemColor: ColorManager.buttonColor,
      unselectedItemColor: ColorManager.greyColor,
      backgroundColor: Colors.white,
      elevation: 0,
      onTap: (index) {
        switch (index) {
          case 0:
            GoRouter.of(context).push(AppRouter.homeScreen); // صفحة Home
            break;
          case 1:
            GoRouter.of(context).push(AppRouter.searchScreen); // صفحة Search
            break;
          case 2:
            GoRouter.of(context).push(AppRouter.categoryScreen); // صفحة Categories (المسار الأساسي)
            break;
          case 3:
            GoRouter.of(context).push(AppRouter.cartScreen); // صفحة Cart
            break;
          case 4:
            GoRouter.of(context).push(AppRouter.accountScreen); // صفحة Account
            break;
        }
      },
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
        BottomNavigationBarItem(icon: Icon(Icons.category), label: 'Categories'),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account'),
      ],
    );
  }
}
