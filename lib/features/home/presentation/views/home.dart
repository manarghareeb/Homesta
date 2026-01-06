import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:homesta/core/theming/colors.dart';
import 'package:homesta/features/account/presentation/views/account_screen.dart';
import 'package:homesta/features/cart/presentation/views/wishlist_screen.dart';
import 'package:homesta/features/categories/presentation/views/categories_screen.dart';
import 'package:homesta/features/search/presentation/views/search_screen.dart';
import 'package:homesta/features/home/presentation/views/home_screen.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int index = 0;

  final List<Widget> screens = const [
    HomeScreen(),
    SearchScreen(),
    CategoriesScreen(),
    WishlistScreen(),
    AccountScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final bool isTablet = constraints.maxWidth >= 700;

        return Scaffold(
          body: Row(
            children: [
              if (isTablet) _buildNavigationRail(),
              Expanded(child: screens[index]),
            ],
          ),
          bottomNavigationBar: isTablet ? null : _buildBottomNav(),
        );
      },
    );
  }

  Widget _buildBottomNav() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: index,
      selectedItemColor: ColorManager.primaryColor,
      unselectedItemColor: Colors.grey,
      onTap: (value) => setState(() => index = value),
      items: const [
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.house),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.magnifyingGlass),
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
    );
  }

  Widget _buildNavigationRail() {
    return NavigationRail(
      selectedIndex: index,
      onDestinationSelected: (value) {
        setState(() => index = value);
      },
      labelType: NavigationRailLabelType.all,
      selectedIconTheme: IconThemeData(color: ColorManager.primaryColor),
      selectedLabelTextStyle: TextStyle(color: ColorManager.primaryColor),
      destinations: const [
        NavigationRailDestination(
          icon: Icon(FontAwesomeIcons.house),
          label: Text('Home'),
        ),
        NavigationRailDestination(
          icon: Icon(FontAwesomeIcons.magnifyingGlass),
          label: Text('Search'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.widgets_outlined),
          label: Text('Categories'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.shopping_cart_outlined),
          label: Text('Cart'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.person_outline),
          label: Text('Account'),
        ),
      ],
    );
  }
}
