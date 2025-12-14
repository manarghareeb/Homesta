import 'package:go_router/go_router.dart';
import 'package:homesta/features/account/presentation/views/edit_profile_screen.dart';
import 'package:homesta/features/account/presentation/views/help_center_screen.dart';
import 'package:homesta/features/account/presentation/views/my_order_screen.dart';
import 'package:homesta/features/authentication/presentation/views/add_new_password_screen.dart';
import 'package:homesta/features/authentication/presentation/views/forget_password_screen.dart';
import 'package:homesta/features/authentication/presentation/views/login_screen.dart';
import 'package:homesta/features/authentication/presentation/views/set_new_password_screen.dart';
import 'package:homesta/features/authentication/presentation/views/signup_screen.dart';
import 'package:homesta/features/authentication/presentation/views/verification_screen.dart';
import 'package:homesta/features/categories/presentation/views/category_section_screen.dart';
import 'package:homesta/features/checkout/presentation/views/checkout_screen.dart';
import 'package:homesta/features/home/presentation/views/home.dart';
import 'package:homesta/features/home/presentation/views/product_details_screen.dart';
import 'package:homesta/features/notification/presentaion/views/notification.dart';
import 'package:homesta/features/onboarding/presentation/views/onboarding_screen.dart';

import '../../features/account/presentation/views/account_screen.dart';
import '../../features/cart/presentation/views/cart_screen.dart';
import '../../features/notification/presentaion/views/notification_empty_screen.dart';
import '../../features/search/presentation/views/search_screen.dart';

abstract class AppRouter {
  static final loginScreen = '/loginScreen';
  static final signUpScreen = '/signUpScreen';
  static final forgetPasswordScreen = '/forgetPasswordScreen';
  static final editProfileScreen = '/editProfileScreen';
  static final myOrderScreen = '/myOrderScreen';
  static final helpCenterScreen = '/helpCenterScreen';
  static final productDetailsScreen = '/productDetailsScreen';
  static final categoryScreen = '/categoriesScreen';
  static final homeScreen = '/homeView';
  static final searchScreen = '/searchScreen';
  static final cartScreen = '/sartScreen';
  static final accountScreen = '/accountScreen';
  static final notificationScreen = '/notificationScreen';
  //static final categorySectionScreen = '/categorySectionScreen';
  static const String categorySectionScreen = '/categorySection/:title';
  static final checkoutScreen = '/checkoutScreen';
  static final addNewPasswordScreen = '/addNewPasswordScreen';
  static final setNewPasswordScreen = '/setNewPasswordScreen';
  static final verficationScreen = '/verificationScreen';

  static final route = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => HomeView()),
      GoRoute(
        path: loginScreen,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: signUpScreen,
        builder: (context, state) => const SignupScreen(),
      ),
      GoRoute(
        path: forgetPasswordScreen,
        builder: (context, state) => const ForgetPasswordScreen(),
      ),
      GoRoute(
        path: editProfileScreen,
        builder: (context, state) => const EditProfileScreen(),
      ),
      GoRoute(
        path: myOrderScreen,
        builder: (context, state) => const MyOrderScreen(),
      ),
      GoRoute(
        path: helpCenterScreen,
        builder: (context, state) => const HelpCenterScreen(),
      ),
      GoRoute(
        path: productDetailsScreen,
        builder: (context, state) => const ProductDetailsScreen(),
      ),
      GoRoute(path: homeScreen, builder: (context, state) => const HomeView()),
      GoRoute(
        path: searchScreen,
        builder: (context, state) => const SearchScreen(),
      ),
      GoRoute(
        path: cartScreen,
        builder: (context, state) => const CartScreen(),
      ),
      GoRoute(
        path: accountScreen,
        builder: (context, state) => const AccountScreen(),
      ),
      /*GoRoute(
        path: categorySectionScreen,
        builder: (context, state) => const CategorySectionScreen(title: '',),
      ),*/
      GoRoute(
        path: '/categorySection/:title',
        builder: (context, state) {
          final title = state.pathParameters['title']!;
          return CategorySectionScreen(title: title);
        },
      ),
      GoRoute(
        path: checkoutScreen,
        builder: (context, state) => const CheckoutScreen(),
      ),
      GoRoute(
        path: addNewPasswordScreen,
        builder: (context, state) => const AddNewPasswordScreen(),
      ),
      GoRoute(
        path: setNewPasswordScreen,
        builder: (context, state) => const SetNewPasswordScreen(),
      ),
      GoRoute(
        path: verficationScreen,
        builder: (context, state) => const VerificationScreen(),
      ),
      GoRoute(
        path: notificationScreen,
        builder: (context, state) => const NotificationScreen(),
      ),
    ],
  );
}
