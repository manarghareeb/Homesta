import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/features/account/presentation/views/account_screen.dart';
import 'package:homesta/features/cart/presentation/views/cart_screen.dart';
import 'package:homesta/features/categories/presentation/views/categories_screen.dart';
import 'package:homesta/features/home/presentation/views/home_screen.dart';
import 'package:homesta/features/search/presentation/views/search_screen.dart';
import 'package:homesta/features/notification/presentaion/views/notification.dart';

import '../../../notification/presentaion/views/notification_empty_screen.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key, this.initialIndex = 0});
  final int initialIndex;

  @override
  State<HomeView> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeView> {
  late int index;
  List<Widget> screens = [
    const HomeScreen(),
    const SearchScreen(),
    const CategoriesScreen(),
    const CartScreen(),
    const AccountScreen(),
  ];

  @override
  void initState() {
    super.initState();
    index = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: index == 0
          ? AppBar(
        title: Text(
          'Home',
          style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_none,
                color: ColorManager.buttonColor),
            onPressed: () {
              final bool hasNotifications = true; // أو حسب البيانات من السيرفر/الـ API
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => hasNotifications
                      ? const NotificationScreen()
                      : const NotificationEmptyScreen(),
                ),
              );
            },
          ),
        ],
      )
          : null,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        elevation: 20,
        backgroundColor: Colors.white,
        selectedItemColor: ColorManager.buttonColor,
        unselectedItemColor: Colors.grey,
        currentIndex: index,
        onTap: (value) {
          setState(() {
            index = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.house, size: 21.sp),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.magnifyingGlass, size: 21.sp),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.widgets_outlined),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Account',
          ),
        ],
      ),
      body: screens[index],
    );
  }
}
