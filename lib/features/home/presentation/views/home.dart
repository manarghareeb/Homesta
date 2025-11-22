import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/features/account/presentation/views/account_screen.dart';
import 'package:homesta/features/cart/presentation/views/cart_screen.dart';
import 'package:homesta/features/categories/presentation/views/categories_screen.dart';
import 'package:homesta/features/home/presentation/views/home_screen.dart';
import 'package:homesta/features/search/presentation/views/search_screen.dart';

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
            //icon: SvgPicture.asset('assets/images/iconamoon_category-light.svg'),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            //icon: SvgPicture.asset('assets/images/mdi-light_cart.svg'),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            //icon: Icon(FontAwesomeIcons.solidUser, size: 21.sp),
            label: 'Account',
          ),
        ],
      ),
      body: screens[index],
    );
  }
}